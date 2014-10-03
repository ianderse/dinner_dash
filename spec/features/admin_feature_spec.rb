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

  it "can see all users" do
    visit '/users'
    expect(page).to have_content("Users")
  end

  it "can see the profile of an individual user" do
    visit "/users/#{user.id}"
    expect(page).to have_content("User Page")
  end
end
