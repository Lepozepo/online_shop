# /tests/jasmine/client/integration/publishers/products_pub_test.coffee

do ->
	'use strict'

	describe "Products publisher", ->
		it "should return product data", ->
			# SETUP
			subscription = Meteor.subscribe("products")

			if subscription.ready()
				# EXECUTE
				product = Products.findOne()

				# VERIFY
				expect product
					.not.toBeUndefined()

