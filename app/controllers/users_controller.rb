class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @bookings = @user.bookings
    @listings = @user.listings
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User information was successfully updated."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :location) # Add other attributes as needed
  end
end
