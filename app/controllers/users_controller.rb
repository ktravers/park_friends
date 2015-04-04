class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    set_user
  end

  def update
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

