class SessionsController < ApplicationController
  def new; end

  def create
    auth = Authenticator.new(user_params.to_h)
    session[:user_id] = auth.user.id

    if auth.valid?
      redirect_to articles_path, notice: "Logged in!"
    else
      redirect_to new_session_path, notice: "Not Logged in!"
    end
  end

private

  def user_params
    params.permit(:username, :password)
  end
end
