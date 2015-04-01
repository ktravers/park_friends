class SessionsController < ApplicationController

  def create
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
    login(user)    ### TODO: DEFINE THIS METHOD => APPLICATION CONTROLLER
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    reset_session
    redirect_to root_path, :notice => "Signed out!"
  end

  private 
    def auth_hash
      request.env['omniauth.auth']
    end

end