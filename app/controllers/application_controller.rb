class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  def check_if_admin
    redirect_to orders_path, notice: 'Access Denied' unless current_user.admin?
  end
end
