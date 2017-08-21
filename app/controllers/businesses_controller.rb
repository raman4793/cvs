class BusinessesController < ApplicationController
  before_action :authenticate_admin!, only: [:invoices]
  def show
    
  end
  def new
    @business = Business.new
  end

  def create
    # @admin = Admin.new(admin_params[:admins])
    @business = Business.new(business_params)
    if @business.save

      redirect_to root_url, notice: 'You request has been registered, Wait for the admin to approve your business'
    else
      puts(@business.errors.full_messages)
      redirect_to new_business_url, notice: 'Business not created'
    end

  end

  def pricing
    # @stripe_list = Stripe::Plan.all
    # @plans = @stripe_list[:data]
    @plans = Plan.all
  end

  def invoices
    @invoices = Stripe::Invoice.all(customer: current_admin.business.customer_token)
  end

  private

  def business_params
    params.require(:business).permit(:name, :admin_id, :type_id, :plan_id, :stripe_card_token, admin_attributes: [:email , :password , :password_confirmation])
  end

  def admin_params
    params.require(:business).permit(admins: [:name, :email, :password, :password_confirmation])
  end

end
