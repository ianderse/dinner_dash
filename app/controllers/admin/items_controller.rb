class Admin::ItemsController < Admin::BaseController
  load_and_authorize_resource

  def new
    @item = Item.new
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
    @categories = @item.categories
  end

  def edit
    @admin_item = Item.find(params[:id])
    @categories = Category.all
  end

  def create
    #refactor this
    @item = Item.new(item_params)
    @categories = params[:categories] || []
    @categories.each do |category|
      category = Category.find(category)
      @item.categories << category
    end
    if @item.save
      redirect_to admin_path
      flash[:notice] = "Your item has been successfully added to the menu!"
    else
      redirect_to :back
      flash[:notice] = "All fields are required to create a menu item, including category."
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to admin_path
  end

  def update
    #refactor this
    @admin_item = Item.find(params[:id])
    @categories = params[:categories] || []
    @admin_item.categories = []
    @categories.each do |category|
      category = Category.find(category)
      @admin_item.categories << category
    end

    if @admin_item.update(item_params)
      flash[:notice] = "Your item has been successfully updated!"
      redirect_to admin_item_path(@admin_item)
    else
      redirect_to :back
      flash[:notice] = "Error saving item."
    end
  end

  private

    def item_params
      params.require(:item).permit(:title, :description, :price, :image, :category, :active)
    end

end
