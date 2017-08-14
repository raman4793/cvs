class Admins::UsersController < ApplicationController
  before_filter :authenticate_admin!
  def new
    @user = current_admin.business.users.build
  end

  def create
    @user = current_admin.business.users.build(user_params)
    if @user.save
      redirect_to root_url, notice: 'User created succesfully'
    else
      redirect_to new_admins_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :uname, :password, :password_confirmation)
  end
end
