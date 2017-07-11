class BusinessesController < ApplicationController
  before_action :authenticate_admin!
  def new
    if current_admin.business
      redirect_to root_url
    else
      @business = Business.new
    end
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to root_url
    else
      redirect_to new_business_url, notice: 'Business not created'
    end

  end

  private

  def business_params
    params.require(:business).permit(:name, :admin_id, :type_id)
  end

end
