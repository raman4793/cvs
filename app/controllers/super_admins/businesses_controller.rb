class SuperAdmins::BusinessesController < ApplicationController
  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
  end

  private
  def business_params
    params.require(:business).permit(:approved)
  end
end
