class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    set_user
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to @user, :notice => "Profile updated."
    else
      redirect_to @user, :notice => "Sorry, unable to update user."
    end
  end

  private
    # finds existing user object in database using params[:id]
    def set_user
      @user = User.find(params[:id])
    end

    # strong params
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :zipcode, :profile_picture, :favorite_games, :host, :provider, :uid, :token, :expires_at, :expires)
    end
end

