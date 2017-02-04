class SessionsController < ApplicationController
  def create
    @user = User.update_or_create(env["omniauth.auth"])
    log_in @user
    redirect_to root_path
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
