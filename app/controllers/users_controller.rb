class UsersController < ApplicationController

  def show
    set_user
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :zipcode, :profile_picture, :favorite_games, :host, :provider, :uid, :token, :expires_at, :expires)
    end
end

