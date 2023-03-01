class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_listing, only: [:show, :destroy]

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:content, :location, :title, :price)
  end
end
