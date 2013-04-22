class SessionsController < ApplicationController
  def create
    response = Instagram.get_access_token(params[:code], redirect_uri: oauth_callback_url)
    session[:access_token] = response.access_token
    redirect_to root_path
  end

  def destroy
    session[:access_token] = nil
    redirect_to root_path
  end
end
