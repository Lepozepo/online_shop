# /products/client/products.coffee

Template.created "products", ->
	@autorun =>
		# tags is an array of tag _ids
		tags = Session.get "products.tags"
		filter = {}

		if tags and not _.isEmpty tags
			_.extend filter,
				tags:tags

		@subscribe "products", filter

Template.products.helpers
	products: ->
		[
			{name:"Nuka Cola", price: 1099}
			{name:"1up Soda", price: 999}
			{name:"JuggerNog", price: 899}
		]
