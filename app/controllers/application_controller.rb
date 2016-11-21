class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
=======
  
  helper_method :current_user, :logged_in?, :require_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = 'You must be logged in to perform this action'
      redirect_to root_path
    end
  end
>>>>>>> 72b7ab20a45b613381c0f4ce5866da23ca6e351b
end
