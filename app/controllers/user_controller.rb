class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @bookings = @user.bookings
  end

  def update
  end
end
