# /_globals/client/formatters.coffee

Template.registerHelper "format_money", (value) ->
	if _.isNumber value
		"$#{(value / 100).toFixed(2)}"
