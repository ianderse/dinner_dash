require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 5

describe 'unauthenticated user', type: :feature do
  include Capybara::DSL

  it "can browse all items" do
    visit '/'
    click_link 'Menu'
    expect(current_path).to eq(items_path)
    expect(page).to have_content 'Menu'
  end

  it "can browse items by category", js: true do
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

  it "can view a single item" do
    small_plates_category = create(:category, title: 'Small Plates')
    item = create(:item, title: 'Second Food', categories: [small_plates_category])
    visit '/'
    click_on 'Menu'
    within(".grid-item") do
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

  it "cannot view another user's private data" do
    user = create(:user, id: 1, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf')
    visit user_path(user)
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You are not authorized to access this page')
  end

  it "cannot view the administrator screens or use administrator functionality" do
    visit '/admin'
    expect(current_path).to eq(root_path)
    expect(page).to have_content('You are not authorized to access this page')
  end

  it "cannot make themselves an administrator" do
    visit new_user_path
    expect(page).to_not have_content('Role')
  end


  context "when using the cart", js: true do
    before do
      create(:item, title: 'red t-shirt')
      visit items_path
      click_on 'Add to cart'
      expect(page).to have_content 'Item added to your cart!'
    end

    it "can add an item to cart" do
      within('.cart-container') do
        expect(page).to have_content '1'
        find('a').click
      end
      expect(current_path).to eq(cart_edit_path)
      expect(page).to have_content('Your Cart')
      expect(page).to have_content('red t-shirt')
    end

    it "can add a multiple of the same item to cart" do
      fill_in 'quantity', with: "3"
      click_on 'Add to cart'
      within('.cart-container') do
        expect(page).to have_content '4'
      end
    end

    it "can update the quantity of an item in the cart" do
      visit cart_edit_path
      fill_in('quantity', with: '2')
      find('#update_quantity').click
      within('.cart-container') do
        expect(page).to have_content '2'
      end
      selected = find('#quantity').value
      expect(selected).to eq('2')
    end

    it "can remove an item from the cart" do
      visit cart_edit_path
      find("#remove_item").click
      within('.cart-container') do
        expect(page).to have_content '0'
      end
    end

    it "can clear the cart" do
      visit cart_edit_path
      click_on 'clear my cart'
      within('.cart-container') do
        expect(page).to have_content '0'
      end
    end

    it 'can log in, which does not clear the cart' do
      visit root_path
      within('.cart-container') do
        expect(page).to have_content '1'
      end
      user = create(:user, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf')
      visit '/'
      fill_in 'email', with: "#{user.email}"
      fill_in 'password', with: "#{user.password}"
      click_on 'login'
      expect(page).to have_content 'Login successful'
      expect(current_path).to eq items_path
      within('.cart-container') do
        expect(page).to have_content '1'
      end
    end

    it 'cannot checkout' do
      visit cart_edit_path
      expect(page).to_not have_content 'Checkout'
    end
  end
end
