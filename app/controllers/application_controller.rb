class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_user_permission

  def current_user
    @current_account ||= Account.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  private

  def check_user_permission
    redirect_to signin_path unless current_user
  end
end
