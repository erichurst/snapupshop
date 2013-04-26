class SessionsController < ApplicationController
  def create
    response = Instagram.get_access_token(params[:code], redirect_uri: oauth_callback_url)
    @user = User.find_or_create_from_instagram_response(response)
    session[:session_token] = @user.api_token
    redirect_to @user
  end

  def destroy
    session[:session_token] = nil
    redirect_to root_path
  end
end
