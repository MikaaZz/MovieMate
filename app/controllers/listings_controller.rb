class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @user = @listing.user
    @booking = Booking.new
    @listings = @user.listings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listings_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { redirect_to listings_path, alert: "Failed to create booking." }
      end
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.update(listing_params)
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :location, :description, :price, :photo, :category)
  end

end
