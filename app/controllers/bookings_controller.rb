class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @listing = @booking.listing
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.listing = Listing.find(params[:listing_id])
    @booking.price = @booking.listing.price * @booking.duration
    @listing = @booking.listing
    @booking.user = @user
    respond_to do |format|
      if @booking.save
        format.html do
          redirect_to listing_booking_path(listing_id: @listing.id, id: @booking.id),
                      notice: "Booking was successfully created."
        end
      else
        format.html { redirect_to listings_path, alert: "Failed to create booking." }
      end
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :request, :duration)
  end
end
