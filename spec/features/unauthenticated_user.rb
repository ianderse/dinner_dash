require 'spec_helper'

describe 'unauthenticated user', type: :feature do

  it "can browse all items" do
    visit '/'
    click_link 'Menu'
    expect(current_path).to eq(items_path)
    expect(page).to have_content 'Menu'
    # expect(page).to have ____________
  end

  # it "can browse items by category" do
  # # When I visit the homepage
  #   visit '/'
  # # And I click on the Menu button
  #   click_link 'Menu'
  # # And I click on Appetizers link
  # #  click_link 'Appetizers'
  # # Then I see a page with only appetizer items
  #   # expect(current_path).to have_content 'Appetizers'
  # end
  #
  # it "can create an account" do
  #   # When I visit the homepage
  #   visit '/'
  #   # And I click the 'Create Account' link
  #   click_link 'Create Account'
  #   expect(current_path).to eq new_user_path
  #   fill_in 'First Name', with: => 'Joe'
  #   fill_in 'Last Name', with: => 'Smithers'
  #   fill_in 'Email', with: => 'jsmithers@example.com'
  #   fill_in 'Confirm Email', with: => 'jsmithers@example.com'
  #   fill_in 'Nickname', with: => 'jsmithers1000'
  #   click_button 'Create Account'
  #   expect(page)
  #   # And I fill out the form with valid info
  #   # I see a message showing that my account has been created successfully
  #   # I see that that I am logged in as my username or fullname
  # end
  #
  # it "cannot create an account with invalid data" do
  #   # When I visit the homepage
  #   # And I click the 'Create Account' link
  #   # And I fill out the form with an invalid format for an email address
  #   # I see that all the data I entered is still in the form
  #   # I see a notice asking me to enter an email in a valid format
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
  # it "View my cart"
  # When I visit the homepage
  # And I click on the cart icon
  # Then I see a page with that lists my cart items
  #
  # Remove an item from my cart
  #
  #
  # Increase the quantity of a item in my cart
  #
  #
  # Log in, which does not clear the cart
  #
  #
  # Unauthenticated users are NOT allowed to:

  # CANNOT:
  # View another user’s private data (such as current order, etc.)
  # Checkout (until they log in)
  # View the administrator screens or use administrator functionality
  # Make themselves an administrator

end
