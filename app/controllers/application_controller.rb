class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # finds or creates current user based on session information
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user

  # checks whether a current user exists, returns true if yes, returns false if not
  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  # "logs in" user by setting session user_id to user.id
  def login(user)  
    session[:user_id] = user.id
  end

  # returns concatenation of current user's name
  def current_user_full_name
    "#{current_user.first_name} #{current_user.last_name}"
  end
  helper_method :current_user_full_name

end
