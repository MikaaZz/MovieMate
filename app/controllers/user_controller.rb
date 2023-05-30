class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user.listings = @listings
  end

  def edit
  end

  def update
  end

end
