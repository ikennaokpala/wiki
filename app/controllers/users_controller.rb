class UsersController < ApplicationController
  def new; end

  def create
    User.create(user_params.to_h)
    redirect_to new_user_path
  end

private

  def user_params
    params.permit(:username, :email, :password)
  end
end
