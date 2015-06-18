Meteor.publish "products", ->
	Products.find {},
		limit:10



