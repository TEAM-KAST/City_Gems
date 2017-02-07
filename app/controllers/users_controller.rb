class UsersController < ApplicationController

  def show
    @user = current_user
    @created = current_user.pins
    @commented = #list of pins user commented on
  end

end
