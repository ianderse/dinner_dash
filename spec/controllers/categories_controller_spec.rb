RSpec.describe CategoriesController, :type => :controller do
  describe "GET index" do
    it 'assigns @items' do
      create(:item)
      items = Item.all
      get :index
      expect(assigns(:items)).to eq(items)
    end

    it 'assigns @categories' do
      create(:category)
      categories = Category.all
      get :index
      expect(assigns(:categories)).to eq(categories)
    end
  end
end
