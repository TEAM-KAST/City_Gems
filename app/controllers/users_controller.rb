class UsersController < ApplicationController

  def show
    @user = current_user
    @created = current_user.pins
    @commented = current_user.commented_pins
  end

end
