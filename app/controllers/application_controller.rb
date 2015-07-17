class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !session[:session_token].nil?
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def redirect_unless_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def redirect_if_logged_in
    redirect_to bands_url if logged_in?
  end

  def disallow_modifications_from_nonadmins
    render text: "403 FORBIDDEN" unless current_user.admin
  end

  helper_method [:current_user, :logged_in?]
end
