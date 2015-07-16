# /products/client/product.coffee

Template.created "product", ->
	@autorun =>
		filter = {}

		# Get the product ID from the context
		product = @data._id
		_.extend filter,
			product:product

		# Get the order if any
		order = Session.get "global.order"
		if order and not _.isEmpty order
			_.extend filter,
				order:order

		@subscribe "product", filter


Template.product.events
	"click button.add-to-cart": (event) ->
		# Get the session variable
		order_id = Session.get "global.order"
		order = Orders.findOne order_id

		# Insert Order if it doesn't exist
		unless order
			order_id = Orders.insert
				status:"new"
				total_products:0
				subtotal:0
				total:0

			# Set the session variable for future reference
			Session.setPersistent "global.order",order_id

		# Find the order
		order = Orders.findOne order_id

		# Check for details on this product
		detail = OrderDetails.findOne
			product:@_id
			order:order_id

		if detail
			# Increase by one if the details exist
			OrderDetails.update detail._id,
				$inc:
					quantity:1

			Orders.update order_id,
				$inc:
					total_products:1
					subtotal:@price
					total:@price
		else
			# Insert if details do not exist
			OrderDetails.insert
				quantity:1
				product:@_id
				order:order_id

			Orders.update order_id,
				$inc:
					total_products:1
					subtotal:@price
					total:@price

	"click button.modify-quantity": ->
		FlowRouter.go "order_quantity",
			product:@_id








