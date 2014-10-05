class Admin::CategoriesController < Admin::Controller
	load_and_authorize_resource

	def index
		@items = Item.all
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to admin_path
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to admin_categories_url
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		redirect_to admin_path
	end

	private

	def category_params
		params.require(:category).permit(:title, :description)
	end
end
