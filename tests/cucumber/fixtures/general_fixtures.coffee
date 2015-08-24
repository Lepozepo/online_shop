do ->
	'use strict'

	Meteor.methods
		"reset_all": ->
			# Reset all collections
			Orders.remove {}
			OrderDetails.remove {}
			ProductImages.remove {}
			Products.remove {}
			ProductsTags.remove {}
			Payments.remove {}
			Tags.remove {}
			Meteor.users.remove {}
			Meteor.roles.remove {}

