class UsersController < ApplicationController

  before_filter :authenticate_user!, only: [:update]

  def show
    @user = User.find(params[:id])
  end

  def update

  end
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
