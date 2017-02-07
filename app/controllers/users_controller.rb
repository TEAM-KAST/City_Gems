class UsersController < ApplicationController

  def show
    @user = current_user
    @created = current_user.pins
  end

end