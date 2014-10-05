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


  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password, :role)
  end

end
