class Admin::UsersController < Admin::Controller
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
      flash[:notice] = "You successfully created #{@user.role} #{@user.full_name}!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information has been successfully updated!"
      redirect_to admin_path
    else
      redirect_to :back
      flash[:notice] = "Error saving your new information."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_path
  end

  def edit
    @user = User.find(params[:id])
    render 'edit_user_role'
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :role)
  end

end
