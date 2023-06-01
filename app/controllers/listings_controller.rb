class ListingsController < ApplicationController
  def index
    query = params[:query]
    if query.present?
      @listings = Listing.search_by_title_description_location_category(query)
    else
      @listings = Listing.all
    end


    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @user = @listing.user
    @booking = Booking.new
    @listings = @user.listings
    @reviews = @booking.reviews
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listings_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { redirect_to listings_path, alert: "Failed to create listing." }
        puts @listing.errors.full_messages.inspect
        raise
      end
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listings_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { redirect_to listings_path, alert: "Failed to update listing." }
        puts @listing.errors.full_messages.inspect
        raise
      end
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :location, :description, :price, :photo, :category)
  end
end
