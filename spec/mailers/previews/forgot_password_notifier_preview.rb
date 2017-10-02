# Preview all emails at http://localhost:3000/rails/mailers/forgot_password_notifier
class ForgotPasswordNotifierPreview < ActionMailer::Preview
  def notify_preview
    ForgotPasswordNotifierMailer.notify(create(:user))
  end
end
