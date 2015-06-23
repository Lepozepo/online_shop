Meteor.publish "products", (ops={}) ->
	limit = 10

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
							options:
								limit:limit
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
		@relations
			collection:Products
			options:
				limit:limit
			mappings:[
				{
					key:"product"
					collection:ProductImages
				}
			]

	@ready()



