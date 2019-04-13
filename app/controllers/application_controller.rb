class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin_only 

  def current_user 
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end 

  def logged_in?
    !!current_user
  end

  def admin_only 
    unless current_user.admin 
      redirect_to user_path(current_user)
    end 
  end
end 
