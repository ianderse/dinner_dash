require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'admin user', type: :feature do
  let(:user) { create(:user, role:'admin') }

	before do
    visit '/'
    fill_in 'email', with: "#{user.email}"
    fill_in 'password', with: "#{user.password}"
    click_on 'login'
	end


	it 'has a role of admin' do
		visit '/'
		expect(page).to have_content("administrator")
	end

	xit 'can create item listings' do
		small_plates_category = create(:category, title: 'Small Plates')
		create(:item, id: 1, title: 'Second Food', categories: [small_plates_category])
		visit '/items/1/edit'
		expect(page).to have_content("add new item")
	end

	xit 'can create item listings with title, description, price' do
		visit 'items/4/edit'
		expect(page).to have_content("title", "description", "price")
	end

	xit 'can create item listings with category' do
		visit 'items/4/edit'
		expect(page).to have_css '#categories_'
	end

	xit 'can create item listings with photo' do
		visit 'items/4/edit'
		expect(page).to have_css '#image'
	end

	xit 'can edit item listings' do
		visit 'items/4/edit'
		expect(page).to have_content
	end

	xit 'can create named categories for items' do
		visit ''
	end

	xit 'can assign items to categories' do
	end

	xit 'can remove items from categories' do
	end

	xit 'can retire items from being sold' do
	end

	xit 'can see retired items only as an admin' do
	end

  it "can see all users" do
    visit '/users'
    expect(page).to have_content("Users")
  end

  it "can see the profile of an individual user" do
    visit "/users/#{user.id}"
    expect(page).to have_content("User Page")
  end

end
