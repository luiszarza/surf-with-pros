class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
  end

  def new
    @listing = Listing.new
    @user = current_user
  end

  def create
    @listing = Listing.new(listing_params)
    @user = current_user
    @listing.user = @user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    # @restaurant = Restaurant.find(params[:id])
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:content, :location, :title, :price, photos: [])
  end
end
