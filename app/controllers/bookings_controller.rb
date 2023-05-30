class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = Listing.find(params[:listing_id])
    @listing = @booking.listing
    @booking.user = current_user
    respond_to do |format|
      raise
      if @booking.save
        format.html { redirect_to new_listing_booking_path(@listing), notice: "Booking was successfully created." }
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
