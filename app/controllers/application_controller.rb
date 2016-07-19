class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home_path
    root_path
  end

  def user_signed_in?
    session[:user_id].present?
  end

  def current_user
    return if user_signed_in?
    @current_user ||= User.find(session[:user_id])
  end

  helper_method :home_page
  helper_method :user_signed_in?
  helper_method :current_user
end
