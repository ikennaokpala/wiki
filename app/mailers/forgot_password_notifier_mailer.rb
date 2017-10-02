class ForgotPasswordNotifierMailer < ApplicationMailer
  default from: "info@wiki.tt"

  def notify(user)
    @user = user
    mail(to: @user.email, subject: "Reset password notice")
  end
end
