class Admin::CategoriesController < Admin::BaseController
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
		if @category.save
			flash[:notice] = "Your category has been successfully created!"
			redirect_to admin_path
		else
			flash[:notice] = "Error saving category"
			redirect_to :back
		end
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
