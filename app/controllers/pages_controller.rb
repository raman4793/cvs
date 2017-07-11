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

  def super_admin_dashboard
    @businesses = Business.where(:approved => false)
  end

  def admin_dashboard

  end

  def home

  end
end
