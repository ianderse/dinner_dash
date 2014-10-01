class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:notice] = "Login successful"
      session[:user_id] = user.id
      redirect_to items_path
    else
      flash[:errors] = "Invalid Login"
      redirect_to root_path
      # render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logout Successful"
    redirect_to root_path
  end
end
