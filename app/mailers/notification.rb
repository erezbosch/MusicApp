class Notification < ApplicationMailer
  default from: "admin@musicapp.com"

  def activation(user)
    @user = user
    @url  = activate_users_url + "?activation_token=#{@user.activation_token}"
    mail(to: user.email, subject: "activate your account")
  end
end
