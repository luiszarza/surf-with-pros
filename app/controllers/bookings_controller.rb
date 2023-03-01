class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  # def new
  #   @listing = Listing.find(params[:listing_id])
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to profile_path(@booking.user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
