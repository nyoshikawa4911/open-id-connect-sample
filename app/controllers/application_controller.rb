class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :logged_in?, :current_user

  private

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
