class SuperAdmins::BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def update
    @business = Business.find(params[:id])
    puts('Found business')
    if @business.update(business_params)
      puts('Toggled Business')
      # if @business.approved?
      #   puts('Creating Subscription')
      #   plan = Stripe::Plan.retrieve(@business.plan_id.to_s)
      #   puts("Plan #{plan}")
      #   customer = Stripe::Customer.retrieve(@business.customer_token)
      #
      #   puts('Customer creating')
      #
      #   subscription = customer.subscriptions.create(plan: plan.id)
      #   puts('Customer subscribed')
      # else
      #
      # end
    end
  end

  private
  def business_params
    params.require(:business).permit(:approved)
  end
end
