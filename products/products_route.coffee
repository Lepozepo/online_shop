FlowRouter.route "/",
	name:"products"
	action: ->
		FlowLayout.render "layout",
			content:"products"


