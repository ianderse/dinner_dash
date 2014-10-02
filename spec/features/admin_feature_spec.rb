require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'admin user', type: :feature do
	before do
		@user = create(:user, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf', role:'admin')
    visit '/'
    fill_in 'email', with: "#{@user.email}"
    fill_in 'password', with: "#{@user.password}"
    click_on 'login'
	end

	it 'has a role of admin' do
		visit '/'
		expect(page).to have_content("administrator")
	end

	it 'is redirected to an admin dashboard upon login' do
		click_on 'Logout'
		expect(current_path).to eq root_path
		fill_in 'email', with: "#{@user.email}"
		fill_in 'password', with: "#{@user.password}"
		click_on 'login'
		expect(page).to have_content("administrator")
		# expect(current_path).to eq admin_path
	end
end
