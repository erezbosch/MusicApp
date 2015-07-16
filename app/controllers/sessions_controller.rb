class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, except: :destroy
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Incorrect email or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
