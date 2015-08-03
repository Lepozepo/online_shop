# /_globals/server/security.coffee

Security.defineMethod "ifUserIsOwner",
	deny: (type,args,user,doc) ->
		user isnt (doc.user or doc._id)

Security.permit(["update"]).collections([Meteor.users])
	.ifUserIsOwner()
	.onlyProps ["emails"]
	.apply()

Security.permit(["insert","update","remove"]).collections([Meteor.users])
	.ifHasRole "admin"
	.apply()

