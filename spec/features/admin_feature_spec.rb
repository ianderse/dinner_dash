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
		expect(page).to have_content("Administrator")
	end

	it 'is redirected to an admin dashboard upon login' do
		click_on 'Logout'
		expect(current_path).to eq root_path
		fill_in 'email', with: "#{@user.email}"
		fill_in 'password', with: "#{@user.password}"
		click_on 'login'
		expect(page).to have_content("Administrator")
		expect(current_path).to eq admin_path
		expect(page).to have_content "Site Administrator Dashboard"
	end

describe 'admin dashboard' do

		it 'has link to create new items' do
		  visit admin_path
			expect(page).to have_content('Site Administrator Dashboard')
		end

		it 'has link to manage users'
		it 'has link to manage ????'
	end

	it 'can create item listings' do
		small_plates_category = create(:category, title: 'Small Plates')
		create(:item, id: 1, title: 'Second Food', categories: [small_plates_category])
		visit '/admin'
		click_on('Create A New Menu Item')
		expect(page).to have_content("Create New Item")
		fill_in 'Title', with: "Test Item"
		fill_in 'Description', with: "Test Description"
		fill_in 'Price', with: '19.22'
		check('categories_')
		click_on('Create Item')
		expect(page).to have_content("Your item has been successfully added to the menu!")
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
		visit 'admin'
	end

	xit 'can assign items to categories' do
	end

	xit 'can remove items from categories' do
	end

	it 'can retire items from being sold' do
		small_plates_category = create(:category, title: 'Small Plates')
		create(:item, id: 1, title: 'Second Food', categories: [small_plates_category])
		visit '/admin/items/1/edit'
		expect(page).to have_content("Active")
		click_on 'Save Changes'
		expect(page).to have_content("Your item has been successfully updated!")
	end

	##Would like to add onto this; can we specify a specific text for the item id?
	it 'can see retired items only as an admin' do
		small_plates_category = create(:category, title: 'Small Plates')
		item = create(:item, id: 1, title: 'Second Food', categories: [small_plates_category], active: 'false')
		visit '/admin/items/1/edit'
		expect(page).to have_content("Active")
		click_on 'Save Changes'
		expect(page).to have_content("Your item has been successfully updated!")
		click_link 'Return to Your Admin Dashboard'
		expect(page).to have_content"#{item.active}"
		expect(page).to have_content"#{item.id}"
	end

  it "can see all users" do
    visit '/admin'
		click_on 'Create New User or Administrator'
		expect(current_path).to eq new_admin_user_path
    expect(page).to have_content("Create A New User or Administrator")
  end

	it "can create a new user with admin role" do
		visit '/admin/users/new'
		fill_in 'First name', with: 'abc'
		fill_in 'Last name', with: 'poptart'
		fill_in 'Email', with: 'tartkins@example.com'
		fill_in 'Password', with: "abc123"
		fill_in 'Password confirmation', with: "abc123"
		select 'admin', from: 'user_role'
		click_on 'Create New User'
		expect(current_path).to eq admin_users_path
		expect(User.last.role).to eq 'admin'
	end

  it "can see all existing users" do
    visit "/admin/users"
    expect(page).to have_content("Current List of Caussa Users")
  end

	it "can modify it's own information" do
		visit '/admin'
		click_on 'Administrator'
		expect(current_path).to eq edit_admin_user_path(@user)
	end

	it "can modify an existing user's role" do
		nonadmin_user = create(:user, first_name: 'jojo', email: 'jojojo@example.com', password: 'asdf', password_confirmation: 'asdf', role:'user')
		visit '/admin'
		click_on 'View Current Users'
		expect(current_path).to eq admin_users_path
		click_on('user')
		expect(current_path).to eq edit_admin_user_path(nonadmin_user)
		select 'admin', from: 'user_role'
		click_on 'Save Changes'
		expect(User.last.role).to eq 'admin'
	end

end
