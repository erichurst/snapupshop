class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.where(api_token: session[:session_token]).first if session[:session_token]
  end
  helper_method :current_user

  def verify_authentication!
    redirect_to root_path, alert: "Whoa there, Bub. Please sign in." unless current_user
  end

  def instagram_client
    @instagram_client ||= Instagram.client(:access_token => current_user.access_token) if current_user
  end
  helper_method :instagram_client
end
