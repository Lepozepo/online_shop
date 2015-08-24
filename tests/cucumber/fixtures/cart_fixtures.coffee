# /tests/cucumber/fixtures/cart_fixtures.coffee

do ->
	'use strict'

	Meteor.methods
		"anonymous_user": ->
			if @userId
				@setUserId null

		"reset_orders": ->
			Orders.remove {}
			OrderDetails.remove {}
