Meteor.publish "products", ->
	@relations
		collection:Products
		options:
			limit:10
		mappings:[
			{
				key:"product"
				collection:ProductImages
			}
		]

	@ready()



