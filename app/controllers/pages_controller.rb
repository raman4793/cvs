class PagesController < ApplicationController

  before_action :authenticate_super_admin!, only: [:super_admin_dashboard]
  before_action :authenticate_admin!, only: [:admin_dashboard]
  before_action :authenticate_user!, only: [:home]

  def index
  end

  def contact
  end

  def about
  end

  def help
  end

  def transcriber_dashboard
    @jobs = current_transcriber.get_jobs
  end

  def super_admin_dashboard
    @businesses = Business.where(:approved => false)
  end

  def admin_dashboard
    @users = current_admin.business.users
    @jobs = Job.where(user_id: @users.pluck(:id))
  end

  def home
    @user = current_user
  end
end
