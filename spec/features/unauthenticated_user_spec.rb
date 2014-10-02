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

  it "cannot create an account with invalid data" do
    visit '/'
    click_on 'Create Account'
    fill_in 'Email', with: 'awef'
    click_button 'Create Account'
    expect(current_path).to eq users_path
    expect(page).to have_content "Please be sure to include a name and a valid email."
  end
  #
  it "can view a single item" do
    small_plates_category = create(:category, title: 'Small Plates')
    item = create(:item, title: 'Second Food', categories: [small_plates_category])
    visit '/'
    click_on 'Menu'
    within("table") do
      click_on 'Second Food'
    end
    expect(current_path).to eq item_path(item)
    expect(page).to have_content "#{item.title}"
  end

  it "can login" do
    user = create(:user, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf')
    visit '/'
    fill_in 'email', with: "#{user.email}"
    fill_in 'password', with: "#{user.password}"
    click_on 'login'
    expect(page).to have_content 'Login successful'
    expect(current_path).to eq items_path
    expect(page).to_not have_css '#email'
  end

  it "cannot login with invalid credentials" do
    user = create(:user, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf')
    visit '/'
    fill_in 'email', with: "imdrunk"
    fill_in 'password', with: "toodrunktologin"
    click_on 'login'
    expect(page).to have_content 'Invalid Login'
    expect(current_path).to eq root_path
  end

   it "can add item to cart" do
     create(:item, title: 'red t-shirt')
     visit items_path
     click_on 'Add to cart'
     expect(page).to have_content 'Item added to your cart!'
     #expect(.cart-container).to have_content '1'
     #click_on '.cart-container'
     #expect(current_path).to eq(cart_edit_path)
     #expect(page).to have_content('Your Cart')
   end

   #it "can remove an item from the cart"
   #Given my cart has one item
   #When I visit my cart
   #And I click on 'Remove Item'
   #I expect my cart to have a quantity of 0

   #it "can increase the quantity of a item in my cart"
   #Given I visit the Menu and my cart has no items
   #And I click the up arrow next to the item
   #And I click 'Add item to cart'
   #I expect my cart to have a quantity of 2

   #it "can log in, which does not clear the cart"
  
  
   #Unauthenticated users are NOT allowed to:

   #CANNOT:
   #View another user’s private data (such as current order, etc.)
   #Checkout (until they log in)
   #View the administrator screens or use administrator functionality
   #Make themselves an administrator

end
