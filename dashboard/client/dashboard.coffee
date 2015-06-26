@_dashboard = new Mongo.Collection "_dashboard"

Template.created "dashboard", ->
	@autorun =>
		@subscribe "dashboard"


