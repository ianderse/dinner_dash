require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'admin user', type: :feature do
	before do
		user = create(:user, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf', role:'admin')
    visit '/'
    fill_in 'email', with: "#{user.email}"
    fill_in 'password', with: "#{user.password}"
    click_on 'login'
	end


	it 'has a role of admin' do
		visit '/'
		expect(page).to have_content("administrator")
	end

	# As an authenticated Administrator, I can:
# Create item listings including a name, description, price, and upload a photo
# describe 'admin user', type: :feature	do
#
	it 'can create item listings' do
		visit '/items/4'
		expect(page).to have_content("add new item")
	end

	it 'can create item listings with title, description, price' do
		visit 'items/4/edit'
		expect(page).to have_content("title", "description", "price")
	end

	it 'can create item listings with category' do
		visit 'items/4/edit'
		expect(page).to have_css '#categories_'
	end

	it 'can create item listsing with photo' do
		visit 'items/4/edit'
		expect(page).to have_css '#image'
	end


#

# Modify existing items’ name, description, price, and photo
# Create named categories for items (eg: "Small Plates")
# Assign items to categories or remove them from categories. Products can belong to more than one category.
# Retire a item from being sold, which hides it from browsing by any non-administrator




end
