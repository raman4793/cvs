class PlansController < ApplicationController
  before_action :authenticate_super_admin!
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)

    subscription = Stripe::Plan.create(
                                   amount: @plan.amount,
                                   interval: @plan.period,
                                   name: @plan.name,
                                   currency: 'usd',
                                   trial: '30',
                                   id: @plan.id
    )

    respond_to do |format|
      if @plan.save
        format.html { redirect_to root_url, notice: 'plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to root_url, notice: 'plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy

    @plan.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :amount, :period, :number_of_lines, :size_of_files)
  end
end
