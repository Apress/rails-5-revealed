class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def require_user
    redirect_to new_user_path unless current_user
  end

  def current_user
    @current_user = User.find_by id: cookies.signed[:user_id]
  end
end
