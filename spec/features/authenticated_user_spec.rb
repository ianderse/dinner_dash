require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'authenticated user', type: :feature do
	#before do:
		#@user = User.create authenticated user
	#end
	it 'can browse all items'
	it 'can browse items by category'
	it 'can add item to cart'
	it 'can view my cart'
	it 'can remove an item from my cart'
	it 'can increase quantity of an item in my cart'
	it 'can logout'
	it 'can view past orders with links to display each order'
	it 'cannot view another users order'
	it 'cannot view the admin screens'
	it 'cannot access admin edit pages'
	it 'cannot make itself an admit'
	describe 'order display page' do
		it 'displays item with quantity ordered'
		it 'shows line-item subtotals'
		it 'links to each item description'
		it 'shows current status of a pending order'
		it 'shows current status of a completed order'
		it 'shows total order price'
		it 'shows date and time order was submitted'
		it 'shows timestamp when order was completed'
		it 'shows timestamp when order was cancelled'
		it 'cannot add a retired item to the cart'
		it 'can view a retired items page'
	end
end
