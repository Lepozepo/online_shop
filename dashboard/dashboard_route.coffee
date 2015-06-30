FlowRouter.route "/dashboard",
	name:"dashboard"
	action: ->
		FlowLayout.render "layout",
			content:"dashboard"


