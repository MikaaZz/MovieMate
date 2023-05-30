class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
    @listings = @user.listings
    @bookings = @user.bookings
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
  end
end
