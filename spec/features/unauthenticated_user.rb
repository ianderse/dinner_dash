require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'unauthenticated user', type: :feature do
  include Capybara::DSL

  it "can browse all items" do
    visit '/'
    click_link 'Menu'
    expect(current_path).to eq(items_path)
    expect(page).to have_content 'Menu'
  end

  it "can browse items by category" do
    small_plates_category = create(:category, title: 'Small Plates')
    create(:item, title: 'Second Food', categories: [small_plates_category])
    visit '/'
    click_link 'Menu'
    expect(page).to have_content 'Menu'
    click_link 'Small Plates'
    expect(page).to have_content 'Small Plates'
    expect(page).to have_content 'Second Food'
  end

  it "can create an account" do
    visit '/'
    click_link 'Create Account'
    expect(current_path).to eq new_user_path
    fill_in 'First name', with: 'Joe'
    fill_in 'Last name', with: 'Smithers'
    fill_in 'Nickname', with: 'jsmithers1000'
    fill_in 'Email', with: 'jsmithers@example.com'
    fill_in 'Password', with: 'jsmithers@example.com'
    fill_in 'Password confirmation', with: 'jsmithers@example.com'
    click_button 'Create Account'
    expect(page).to have_content "Your account was successfully created!"
    expect(page).to have_content 'Menu'
  end

  # it "can add item to cart" do
  #   # Given I am on the Menu Page
  #   create(:item, title: 'red t-shirt')
  #   visit items_path
  #   # When I click on the 'Buy' button next to a menu item
  #   click_on 'Add to cart'
  #   # Then I see a message notifying me that my item has been added
  #   expect(page).to have_content 'Item added to your cart!'
  #   # And I see a cart icon displaying the number one
  #   within('.cart-container') do
  #     expect(page).to have_content '1'
  #   end
  #
  #   click_on 'Cart'
  #
  #   # asset cart has the item
  # end

  # it "cannot create an account with invalid data" do
    # When I visit the homepage
    # And I click the 'Create Account' link
    # And I fill out the form with an invalid format for an email address
    # I see that all the data I entered is still in the form
    # I see a notice asking me to enter an email in a valid format
  # end
  #
  # it "can view a single item"
  # When I visit the homepage
  # And I click on Menu button
  # And I click on first menu item
  # Then I see a page displaying only that menu item
  #
  # it "can add an item to my cart"
  # When I visit the homepage
  # And I click on Menu button
  # And I click on the 'Buy' button next to first menu item
  # Then I see a message notifying me that my item has been added
  # And I see a cart icon displaying the number one
  #
  # it "can view the cart"
  # When I visit the homepage
  # And I click on the cart icon
  # Then I see a page with that lists my cart items
  #
  # it "can remove an item from the cart"
  #
  #
  # it "can increase the quantity of a item in my cart"
  #
  #
  # it "can log in, which does not clear the cart"
  #
  #
  # Unauthenticated users are NOT allowed to:

  # CANNOT:
  # View another user’s private data (such as current order, etc.)
  # Checkout (until they log in)
  # View the administrator screens or use administrator functionality
  # Make themselves an administrator

end
