class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render @job }
      format.js
    end

  end
  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to root_url
    else
      redirect_to show_transcriber_job_path(@job)
    end
  end


  private
  def job_params
    params.require(:job).permit(:draft, :status, :file_name)
  end
end
