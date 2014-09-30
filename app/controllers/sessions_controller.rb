class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:errors] = "Invalid Login"
      redirect_to root_path
      # render :new
    end
  end

  def destroy
    sesssion.clear
    flash[:notice] = "Logout Successful"
    redirect_to root_path
  end
end
