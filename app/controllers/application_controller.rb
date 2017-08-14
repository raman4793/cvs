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
      nil
    end
  end
end
