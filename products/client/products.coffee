# /products/client/products.coffee

Template.created "products", ->
	@autorun =>
		filter =
			page: Number(FlowRouter.getQueryParam("page")) or 0

		tags = Session.get "products.tags"
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

	pages:
		current: ->
			FlowRouter.getQueryParam("page") or 0

		is_last_page: ->
			limit = 10
			current_page = Number(FlowRouter.getQueryParam("page")) or 0

			max_allowed = limit + current_page * limit
			max_products = Counts.get "products"

			max_allowed > max_products


Template.products.events
	"click .next-page": ->
		FlowRouter.setQueryParams
			page: (Number(FlowRouter.getQueryParam("page")) or 0) + 1

	"click .previous-page": ->
		if (Number(FlowRouter.getQueryParam("page")) or 0) - 1 < 0
			page = 0
		else
			page = (Number(FlowRouter.getQueryParam("page")) or 0) - 1

		FlowRouter.setQueryParams
			page: page


