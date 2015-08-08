# /login/login_route.coffee

FlowRouter.route "/login",
	name:"login"
	triggersEnter:[RT.non_user_only]
	action: ->
		FlowLayout.render "layout",
			content:"login"
