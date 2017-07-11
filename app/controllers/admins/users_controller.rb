class Admins::UsersController < ApplicationController
  before_filter :authenticate_admin!
  def new

  end

  def create
    @user = current_admin.business.users.build(user_params)
    @user.password = ''
    @user.password_confirmation = ''
    @user.save
    redirect_to root_url, notice: 'User created succesfully'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :business_id, :uname)
  end
end
