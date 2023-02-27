# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Cleaning up database..."
Booking.destroy_all
Listing.destroy_all
puts "Database cleaned"

10.times do |i|
  puts "Importing listing from page #{i + 1}"
    Listing.create(
      title: Faker::Superhero.name,
      content: Faker::Company.catch_phrase,
      location: Faker::Address.state,
      price: Faker::Number.decimal,
      user_id: 1
    )
end
