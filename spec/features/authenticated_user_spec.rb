require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 5

describe 'authenticated user', type: :feature do
  include Capybara::DSL

	before do
		user = create(:user, id: 1, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf')
    visit '/'
    fill_in 'email', with: "#{user.email}"
    fill_in 'password', with: "#{user.password}"
    click_on 'login'
	end

	it 'can browse all items' do
		visit '/'
    click_link 'Menu'
    expect(current_path).to eq(items_path)
    expect(page).to have_content 'Menu'
	end

	it 'can browse items by category', js: true do
    small_plates_category = create(:category, title: 'Small Plates')
    create(:item, title: 'Second Food', categories: [small_plates_category])
    visit '/'
    click_link 'Menu'
    expect(page).to have_content 'Menu'
    click_link 'Small Plates'
    expect(page).to have_content 'Small Plates'
    expect(page).to have_content 'Second Food'
	end

	it 'can add item to cart', js: true do
		small_plates_category = create(:category, title: 'Small Plates')
    create(:item, title: 'Second Food', categories: [small_plates_category])
    visit items_path
    find('#add_to_cart').click
    expect(page).to have_content 'Item added to your cart!'
    within('.cart-container') do
        expect(page).to have_content '1'
      end
	end

	it 'can view my cart' do
		within('.cart-container') do
        find('a').click
      end
		expect(current_path).to eq(cart_edit_path)
    expect(page).to have_content('Your Cart')
	end

	it 'can remove an item from my cart', js: true do
		small_plates_category = create(:category, title: 'Small Plates')
    create(:item, title: 'Second Food', categories: [small_plates_category])
    visit items_path
    find('#add_to_cart').click
    expect(page).to have_content 'Item added to your cart!'
    visit cart_edit_path
    find("#remove_item").click
    within('.cart-container') do
      expect(page).to have_content '0'
    end
	end

	it "can update the quantity of an item in the cart", js: true do
		small_plates_category = create(:category, title: 'Small Plates')
    create(:item, title: 'Second Food', categories: [small_plates_category])
    visit items_path
    find('#add_to_cart').click
    expect(page).to have_content 'Item added to your cart!'
    visit cart_edit_path
    fill_in('quantity', with: '2')
    find('#update_quantity').click
    within('.cart-container') do
      expect(page).to have_content '2'
    end
    selected = find('#quantity').value
    expect(selected).to eq('2')
  end

  it "can logout" do
  	visit '/'
    expect(page).to have_content 'Logout'
    click_on 'Logout'
    expect(page).to have_css '#email'
    expect(page).to have_css '#password'
  end

  it 'can view past orders with links to display each order'
	it 'cannot view another users order'

	it 'cannot access admin item pages' do
		small_plates_category = create(:category, title: 'Small Plates')
		create(:item, id: 1, title: 'Second Food', categories: [small_plates_category])
		visit '/admin/items/1/edit'
		expect(page).to_not have_content "Edit Item"
		expect(current_path).to eq(items_path)
		expect(page).to have_content "You are not authorized to access this page."
		visit '/admin/items/new'
		expect(page).to_not have_content "Create New Item"
    expect(current_path).to eq(items_path)
		expect(page).to have_content "You are not authorized to access this page."
	end

  it 'cannot access admin user pages' do
    visit '/admin/users/1/edit'
    expect(page).to_not have_content "User or Admin?"
  end

	it 'cannot make itself an admin' do
		visit '/users/1/edit'
		expect(page).to_not have_content "User or Admin"
	end

  it 'cannot add a retired item to the cart' do
      small_plates_category = create(:category, title: 'Small Plates')
      create(:item, id: 1, title: 'Second Food', categories: [small_plates_category], active: false)
      visit '/items/1'
      expect(page).to have_content "Second Food"
      visit '/items'
      expect(page).to_not have_content "Second Food"
  end

  it 'can view a retired items page' do
      small_plates_category = create(:category, title: 'Small Plates')
      create(:item, id: 1, title: 'Second Food', categories: [small_plates_category], active: false)
      visit '/items/1'
      expect(page).to have_content "Second Food"
  end

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
	end
end
