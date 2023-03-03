class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :date, presence: true, uniqueness: { scope: :listing }
end
