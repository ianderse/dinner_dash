class CategoriesController < ApplicationController
	load_and_authorize_resource

	def show
    @category = Category.find(params[:id]).to_s

    respond_to do |format|
      format.js { @category }
    end
	end
end
