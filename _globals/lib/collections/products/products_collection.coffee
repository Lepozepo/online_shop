# /_globals/lib/collections/products/products_collection.coffee

@Products = new Mongo.Collection "products"

Products.attachSchema new SimpleSchema
	name:
		type:String
		label:"Name"

	description:
		type:String
		label:"Description"
		optional:true

	sku:
		type:String
		label:"SKU"
		optional:true

	price:
		type:Number
		label:"Price"

if Meteor.isServer
	if Products.find().count() is 0
		Products.insert
			name:"Nuka Cola"
			price: 1099

		Products.insert
			name:"1up Soda"
			price: 999

		Products.insert
			name:"JuggerNog"
			price: 899



