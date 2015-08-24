# /tests/cucumber/features/cart/step_definitions/steps.coffee

do ->
	'use strict'
	# You can include npm dependencies
	# _ = require('underscore')
	# assert = require "assert"

	module.exports = ->
		url = require('url')
		@Given /^I am an anonymous customer$/, ->
			@server.call "reset_orders"
			@server.call "anonymous_user"

		@When /^I navigate to "([^"]*)"$/, (path) ->
			@browser
				.url url.resolve(process.env.ROOT_URL, path)

		@When /^I click on the first button with class "([^"]*)"$/, (button) ->
			@browser
				.waitForExist "body *"
				.waitForVisible ".product"
				.element ".product:nth-child(1) #{button}"
				.click()

		@Then /^I should have one product with quantity one in my cart$/, ->
			@browser
				.waitForVisible ".order_detail"
				.getText ".order_detail:nth-child(1) .quantity"
				.then (quantity) ->
					expect quantity
						.to.equal "1"



