class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_user
    if current_user
      current_user
    elsif current_admin
      current_admin
    elsif current_super_admin
      current_super_admin
    elsif current_transcriber
      current_transcriber
    else
      Anonymous.new
    end
  end

  def after_sign_in_path_for(resource)
    root_url
  end
end
