# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

puts "Cleaning up database..."
Booking.destroy_all
Listing.destroy_all
User.destroy_all
puts "Database cleaned"

10.times do
    user = User.create!(
      email: Faker::Internet.email,
      password: "abc123",
      first_name: Faker::Name.first_name,
    )

    puts "Created user #{user.first_name}"

    listing = Listing.create!(
      title: Faker::Superhero.name,
      content: Faker::Company.catch_phrase,
      location: Faker::Address.state,
      price: Faker::Commerce.price,
      user: user
    )

    puts "Created listing #{listing.id} for user #{user.first_name}"
  end