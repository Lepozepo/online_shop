# /products/client/products.coffee

Template.created "products", ->
	@autorun =>
		# tags is an array of tag _ids
		tags = Session.get "products.tags"
		filter = {}

		if tags and not _.isEmpty tags
			_.extend filter,
				tags:tags

		order = Session.get "global.order"
		if order and not _.isEmpty order
			_.extend filter,
				order:order

		@subscribe "products", filter

Template.products.helpers
	products: ->
		Products.find()


