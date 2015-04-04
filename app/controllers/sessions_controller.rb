class SessionsController < ApplicationController

  # uses oauth_hash information to find or create @user
  def create
    @user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || User.create_with_omniauth(auth_hash)  
    login(@user)
    redirect_to dashboard_path, :notice => "Signed in!"

    
  end

  # clears all session information, effectively logging the user out
  def destroy
    reset_session
    redirect_to root_path, :notice => "Signed out!"
  end

  private 
    # protects env['omniauth.auth'] hash info by placing it inside private method
    def auth_hash
      request.env['omniauth.auth']
    end

end
