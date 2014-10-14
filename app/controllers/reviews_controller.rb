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
  	redirect_to item_path(item_id)
  end

  def edit
    @item_id = params[:item_id]
    @review = Review.find(params[:id])
  end

  def update
    item_id = params[:item_id]
    review = Review.find(params[:id])

    if review.update(review_params)
      flash[:notice] = "Your review has been successfully updated."
      redirect_to item_path(item_id)
    else
      flash[:notice] = "Your review was not valid."
      redirect_to :back
    end
  end

  private

  def review_params
  	params.require(:review).permit(:body, :title, :stars)
  end
end
