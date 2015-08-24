# /tests/cucumber/features/cart/add to cart.feature

Feature: Add to Cart

	As a customer
	I want to add items to my cart
	So I can checkout

	Background:
		Given I am an anonymous customer

	@dev
	Scenario: Add one to cart
		When I navigate to "/"
		And I click on the first button with class ".add-to-cart"
		And I navigate to "/cart"
		Then I should have one product with quantity one in my cart
