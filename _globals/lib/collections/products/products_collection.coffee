@Products = new Mongo.Collection "products"

# fields
	# name
	# description
	# sku
	# price

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
