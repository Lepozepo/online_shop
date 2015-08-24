Template.created "cart", ->
	order = Session.get "global.order"

	@autorun =>
		@subscribe "cart",
			order:order

Template.cart.helpers
	"order_details": ->
		OrderDetails.find()

	"product": ->
		Products.findOne @product

