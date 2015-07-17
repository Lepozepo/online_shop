# /products/products_route.coffee

FlowRouter.route "/",
	name:"products"
	action: ->
		FlowLayout.render "layout",
			content:"products"

FlowRouter.route "/products/create",
	name:"create_product"
	action: ->
		FlowLayout.render "layout",
			content:"create_product"
