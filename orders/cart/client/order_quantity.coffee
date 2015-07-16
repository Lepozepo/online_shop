# /orders/cart/client/order_quantity.coffee

# Attach a reactive variable to the instance
# this variable controls our total
Template.created "order_quantity", ->
	@total = new ReactiveVar()

	@autorun =>
		@subscribe "order_quantity",
			product:FlowRouter.current().params.product
			order:Session.get "global.order"

Template.order_quantity.helpers
	# Create a list of numbers for the number pad
	"numbers": ->
		_.map [1,2,3,4,5,6,7,8,9,0], (v,k) ->
			number:String v

	# Get the reactive variable
	# this will automatically update when the variable changes
	"total": ->
		Template.instance().total.get()

Template.order_quantity.events
	# Concatenate numbers to make it work like a number pad
	"click .number": (event,i) ->
		total = i.total.get()

		if total
			new_total = "#{total}#{@number}"
		else
			new_total = "#{@number}"

		i.total.set new_total

	# Remove last number from string
	"click .delete": (event,i) ->
		total = i.total.get()

		if total
			i.total.set total.slice 0,-1

	"click .add-to-cart": (event,i) ->
		# Get the session variable
		order_id = Session.get "global.order"
		order = Orders.findOne order_id

		# Get the total
		total = i.total.get()
		unless total
			return
		else
			total = Number total

		# Get the ID of the product
		product = Products.findOne FlowRouter.current().params.product

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
			product:product._id
			order:order_id

		if detail
			# Increase by one if the details exist
			OrderDetails.update detail._id,
				$inc:
					quantity:total

			Orders.update order_id,
				$inc:
					total_products:1
					subtotal:product.price
					total:product.price
		else
			# Insert if details do not exist
			OrderDetails.insert
				quantity:total
				product:product._id
				order:order_id

			Orders.update order_id,
				$inc:
					total_products:1
					subtotal:product.price
					total:product.price

		FlowRouter.go "products"




