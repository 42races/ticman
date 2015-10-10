class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def random_string
    [*'a'..'z', *'A'..'Z', *'0'..'9'].shuffle.take(8).join
  end
end
