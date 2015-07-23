# /orders/cart/cart_methods.coffee

Meteor.methods
	"cart.add-to-cart": (ops={},callback) ->
		#ops
			# order
			# product
			# quantity

		order = Orders.findOne ops.order
		product = Products.findOne ops.product

		# Insert Order if it doesn't exist
		unless order
			order_id = Orders.insert
				status:"new"
				total_products:0
				subtotal:0
				total:0
		else
			order_id = order._id

		# Set the session variable for future reference
		if Meteor.isClient
			Session.setPersistent "global.order",order_id

		# Find the order
		order = Orders.findOne order_id

		# Check for details on this product
		detail = OrderDetails.findOne
			product:product._id
			order:order._id

		if detail
			# Increase by one if the details exist
			OrderDetails.update detail._id,
				$inc:
					quantity:ops.quantity

			Orders.update order._id,
				$inc:
					total_products:ops.quantity
					subtotal:product.price * ops.quantity
					total:product.price * ops.quantity
		else
			# Insert if details do not exist
			OrderDetails.insert
				quantity:ops.quantity
				product:product._id
				order:order._id

			Orders.update order._id,
				$inc:
					total_products:ops.quantity
					subtotal:product.price * ops.quantity
					total:product.price * ops.quantity

		# Run the callback function if it exists
		callback and callback(null, true)




