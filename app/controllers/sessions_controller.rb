class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    current_user
    redirect_to root_path
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
