class UsersController < ApplicationController
  load_and_authorize_resource

  def new
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Your account was successfully created!"
      session[:user_id] = @user.id
      redirect_to items_path
    else
      flash[:error] = "Please be sure to include a name and a valid email."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :nickname, :password, :password_confirmation)
    end
end
