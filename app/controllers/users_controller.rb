class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      message = Notification.activation(@user)
      message.deliver_now
      redirect_to new_session_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    @user.toggle!(:activated) if @user
    if @user.activated
      log_in_user!(@user)
      redirect_to bands_url
    else
      redirect_to new_user_url
    end
  end
end
