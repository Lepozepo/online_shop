Meteor.publish "dashboard", ->
	totals = Orders.aggregate [
			{
				$match:
					status:"pending"
			}
			{
				$group:
					_id:null
					total:
						$sum:"$total"
					subtotal:
						$sum:"$subtotal"
					discount:
						$sum:"$discount.amount"
			}
		]

	if totals and totals.length > 0 and totals[0]
		@added "_dashboard","totals",totals[0]

