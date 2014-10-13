class ReviewsController < ApplicationController
	load_and_authorize_resource

  def new
  	@review = Review.new
  end

  def create
  	item_id = params[:item_id]
  	review = Review.create(review_params)
  	review.user_id = current_user.id
  	review.item_id = item_id
  	review.save
  	redirect_to items_path(item_id)
  end

  def edit

  end

  def show

  end

  private

  def review_params
  	params.require(:review).permit(:body, :title, :stars)
  end
end
