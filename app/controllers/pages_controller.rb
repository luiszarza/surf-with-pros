class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @my_listings = current_user.listings
    @my_bookings = current_user.bookings_as_teacher
    @my_bookings_as_student = current_user.bookings
    # @my_listings.each do |listing|
    #   @my_bookings << listing.bookings
    # end
    @user = current_user
  end
end
