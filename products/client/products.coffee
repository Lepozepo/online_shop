Template.created "products", ->
	@autorun =>
		# tags is an array of tag _ids
		tags = Session.get "products.tags"
		filter = {}

		if tags and not _.isEmpty tags
			_.extend filter,
				tags:tags

		@subscribe "products", filter


