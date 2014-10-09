class CategoriesController < ApplicationController
	load_and_authorize_resource

  # def index
  #   respond_to do |format|
  #     format.js {}
  #   end
  # end

	def show
    @category = Category.find(params[:id]).to_s

    respond_to do |format|
      format.js { @category }
    end
	end
end
