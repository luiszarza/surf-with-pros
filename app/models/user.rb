class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings # as student
  has_many :listings # as teacher
  has_many :bookings_as_teacher, through: :listings, source: :bookings
  has_one_attached :photo

  def teacher?
    listings.any?
  end

  def is
    
  end
end
