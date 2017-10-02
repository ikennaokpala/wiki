class ForgotPasswordController < UsersController
  def new; end

  def create
    user = User.find_by(username: user_params_hash[:username])

    if user.present?
      EmailJob.set.perform_later(user)
      redirect_to new_forgot_password_path(username: user.username)
    else
      redirect_to new_forgot_password_path
    end
  end

private

  def user_params
    params.permit(:username, :password)
  end

  def user_params_hash
    user_params.to_h
  end
end
