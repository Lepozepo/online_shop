# /_globals/router/config.coffee

if Meteor.isClient
	Meta.config
		options:
			title:"Crashing Meteor"
			suffix:""

	Template.created ->
		except = [
			"Template.__dynamicWithDataContext"
			"Template.__dynamic"
			"Template.layout"
			"Template.layout"
			"body"
		]

		unless _.contains except, @view.name
			window.prerenderReady = false

			if @subscriptionsReady()
				window.prerenderReady = true


FlowRouter.notFound =
	action: ->
		FlowLayout.render "layout",
			content:"not_found"


