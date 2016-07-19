class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home_path
    if user_signed_in?
      dashboard_index_path
    else
      root_path
    end
  end

  def user_signed_in?
    session[:user_id].present?
  end

  def current_user
    return if user_signed_in?
    @current_user ||= User.find(session[:user_id])
  end

  helper_method :home_path
  helper_method :user_signed_in?
  helper_method :current_user

  private

  def authenticate_user!
    redirect_to home_path unless user_signed_in?
  end
end
