class UsersController < ApplicationController
  before_action :verify_authentication!, only: [:home, :edit, :update, :destroy]
  before_action :set_user, only: [:home, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def home
  end

  def show
    @user = User.where(instagram_username: params[:instagram_username]).first!
  rescue ActiveRecord::RecordNotFound => error
    redirect_to root_path, alert: "Woops! There isn't anyone using SnapUp Shop by that name."
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:instagram_username, :email)
    end
end
