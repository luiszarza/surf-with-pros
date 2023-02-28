class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @all_bookings = current_user.bookings
    @user = current_user
  end
end
