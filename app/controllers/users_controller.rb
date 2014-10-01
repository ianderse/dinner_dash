class UsersController < ApplicationController

  def index
  end

  def create
    @user = User.new(new_user_params)

    if @user.save
      flash[:notice] = "Your account was successfully created!"
      redirect_to items_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def new_user_params
    params.require(:user).permit(:first_name, :last_name, :email, :nickname, :password)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :nickname, :password)
  end

end
