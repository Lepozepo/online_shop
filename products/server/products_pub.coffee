# /products/server/products_pub.coffee

Meteor.publish "products", (ops={}) ->
	limit = 10
	product_options =
		skip:ops.page * limit
		limit:limit
		sort:
			name:1

	if ops.tags and not _.isEmpty ops.tags
		@relations
			collection:Tags
			filter:
				_id:
					$in:ops.tags
			mappings:[
				{
					collection:ProductsTags
					key:"tag"
					mappings:[
						{
							collection:Products
							foreign_key:"product"
							options:product_options
							mappings:[
								{
									collection:ProductImages
									key:"product"
								}
							]
						}
					]
				}
			]

	else
		Counts.publish this,"products",
			Products.find()
			noReady:true

		@relations
			collection:Products
			options:product_options
			mappings:[
				{
					key:"product"
					collection:ProductImages
				}
			]

	if ops.order and not _.isEmpty ops.order
		@relations
			collection:Orders
			filter:
				_id:ops.order
				status:"new"
			mappings:[
				{
					collection:OrderDetails
					key:"order"
				}
			]

	@ready()




