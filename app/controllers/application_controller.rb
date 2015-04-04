class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login_required
    if !logged_in?
      flash[:notice] = "Please log in to sign up for a game."
      redirect_to :back
    end
  end

  # finds or creates current user based on session information
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user

  # checks whether a current user exists, returns true if yes, returns false if not
  def logged_in?
    # binding.pry
    !!current_user
  end
  helper_method :logged_in?

  # "logs in" user by setting session user_id to user.id
  def login(user)  
    session[:user_id] = user.id
  end

end
