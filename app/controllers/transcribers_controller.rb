class TranscribersController < ApplicationController

  before_action :authenticate_super_admin!, only: [:create, :index]

  def index

  end

  def new
    @transcriber = Transcriber.new
  end

  def create
    @transcriber = Transcriber.new(transcriber_params)
    if @transcriber.save
      redirect_to root_url, notice: 'Transcriber created'
    else
      redirect_to new_transcriber_url, error: 'Error'
    end
  end

  def job
    @job = Job.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render @job }
      format.js
    end
  end

  def update_job
    @job = Job.find(params[:id])
    job_param = job_params
    job_param[:status] = Job.statuses[:finished]
    @job.update(job_params)
  end

  private

  def transcriber_params
    params.require(:transcriber).permit(:name, :email, :password, :password_confirmation, :business_id)
  end

  def job_params
    params.require(:job).permit(:draft, :status, :file_name)
  end

end
