class ReviewsController < ApplicationController
  def show
    @booking = Booking.find(params[:booking_id])
    @listing = @booking.listing
    @seller = @booking.listing.user
    @buyer = @booking.user
  end

  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @listing = @booking.listing
    @seller = @booking.listing.user
    @buyer = @booking.user
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html do
          redirect_to listing_review_path(listing_id: @listing.id, id: @review.id),
                      notice: "Review was successfully created."
        end
      else
        format.html { redirect_to listings_path, alert: "Failed to create review." }
      end
    end
  end
end
