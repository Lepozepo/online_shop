# /orders/cart/cart_route.coffee

FlowRouter.route "/cart",
	name:"cart"
	action: ->
		FlowLayout.render "layout",
			content:"cart"

FlowRouter.route "/cart/:product/quantity",
	name:"order_quantity"
	action: ->
		FlowLayout.render "layout",
			content:"order_quantity"

