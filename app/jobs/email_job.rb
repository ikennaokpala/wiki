class EmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    ForgotPasswordNotifierMailer.notify(user)
      .deliver_later
  end
end
