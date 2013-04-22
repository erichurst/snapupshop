class HomeController < ApplicationController
  before_action :fetch_token

  def index
  end

  private
  def fetch_token
    if session[:access_token].present?
      @client = Instagram.client(:access_token => session[:access_token])
      @user = @client.user
    end
  end
end
