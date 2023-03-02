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


# puts "Cleaning up database..."
# Booking.destroy_all
# Listing.destroy_all
# User.destroy_all
# puts "Database cleaned"
# user1 = User.create!(email: "john@gmail.com", password: "abc123", first_name: "John")
# Listing.create!(content: "As a surf teacher, my focus is on helping beginners learn the fundamentals of surfing in a safe and supportive environment. I provide personalized attention and constructive feedback to help you progress quickly and confidently.", location: "Bali", title: "The Surf Champion Bali", price: 20, user_id: user1.id)
# user2 = User.create!(email: "eve@gmail.com", password: "abc123", first_name: "Eve")
# Listing.create!(content: "Join me for a surf lesson that blends mindfulness and movement, as we explore the beauty and power of the ocean. I'll guide you through techniques for building strength and balance, while cultivating a sense of calm and connection.", location: "Koh Samui", title: "Surf lesson in Koh Samui", price: 20, user_id: user2.id)
# user3 = User.create!(email: "adam@gmail.com", password: "abc123", first_name: "Adam")
# Listing.create!(content: "With years of experience both in the water and in the classroom, I'm passionate about helping all levels of surfers achieve their goals. Whether you're looking to catch your first wave or refine your technique, I've got you covered.", location: "Los Angeles", title: "One More Wave in Los Angeles", price: 20, user_id: user3.id)
# user4 = User.create!(email: "luis@gmail.com", password: "abc123", first_name: "Luis")
# Listing.create!(content: "My lessons are all about fun and progression. I'll help you build confidence in the water and develop a love for the sport, while also challenging you to push your limits and try new things.", location: "Bruges", title: "Surfing in Bruges", price: 20, user_id: user4.id)
# user5 = User.create!(email: "matt@gmail.com", password: "abc123", first_name: "Matt")
# Listing.create!(content: "From basic paddling and standing up, to advanced maneuvers and wave selection, my lessons are tailored to meet your individual needs and goals. You'll leave feeling empowered and inspired to take your surfing to the next level.", location: "Cape Town", title: "Surfing in Cape Town", price: 20, user_id: user5.id)
# user6 = User.create!(email: "fanny@gmail.com", password: "abc123", first_name: "Fanny")
# Listing.create!(content: "As a lifelong surfer, I'm committed to sharing my love and knowledge of the sport with others. I offer personalized, one-on-one lessons that focus on technique, safety, and fun.", location: "Liverpool", title: "Surfing in Liverpool", price: 20, user_id: user6.id)
# user7 = User.create!(email: "tom@gmail.com", password: "abc123", first_name: "Tom")
# Listing.create!(content: "Join me for a unique surf experience that combines physical training, mental focus, and environmental awareness. You'll leave feeling energized and inspired, with a newfound appreciation for the ocean and its power.", location: "Beijing", title: "Surfing in Beijing", price: 20, user_id: user7.id)
# user8 = User.create!(email: "ante@gmail.com", password: "abc123", first_name: "Ante")
# Listing.create!(content: "My lessons are all about creating a positive and inclusive environment, where everyone feels welcome and supported. Whether you're a seasoned surfer or a complete beginner, I'll work with you to help you achieve your goals and have fun in the process.", location: "Da Nang", title: "Surfing in Da Nang", price: 20, user_id: user8.id)
# user9 = User.create!(email: "simon@gmail.com", password: "abc123", first_name: "Simon")
# Listing.create!(content: "Surfing is about more than just catching waves. It's a lifestyle that requires discipline, dedication, and a deep connection to the natural world. Join me for a lesson that will challenge and inspire you, while also giving you a newfound respect for the ocean and its inhabitants.", location: "Tokyo", title: "Surfing in Tokyo", price: 20, user_id: user9.id)
# user10 = User.create!(email: "robin@gmail.com", password: "abc123", first_name: "Robin")
# Listing.create!(content: "My lessons are designed to help you develop a strong foundation of skills and knowledge, while also fostering a sense of community and connection with other surfers. Together, we'll explore the beauty and excitement of this amazing sport, and create memories that will last a lifetime.", location: "Amsterdam", title: "Surfing in Amsterdam", price: 20, user_id: user10.id)

# listings = Listing.all

# i = 0
# files = [
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742454/development/hk44p4el9cictoeywqx5uy9gv04w.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742451/development/bnkiyvswkv88rx2rdk15r4hqfv3i.jpg"],
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742436/development/up3k8m8p8sq1yx2dk4q05ft3ztfg.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742433/development/ks7lbns8cqca341veqz378squhvf.jpg"],
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742436/development/up3k8m8p8sq1yx2dk4q05ft3ztfg.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742433/development/ks7lbns8cqca341veqz378squhvf.jpg"],
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742436/development/up3k8m8p8sq1yx2dk4q05ft3ztfg.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742433/development/ks7lbns8cqca341veqz378squhvf.jpg"],
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742436/development/up3k8m8p8sq1yx2dk4q05ft3ztfg.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742433/development/ks7lbns8cqca341veqz378squhvf.jpg"],
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742436/development/up3k8m8p8sq1yx2dk4q05ft3ztfg.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742433/development/ks7lbns8cqca341veqz378squhvf.jpg"],
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742436/development/up3k8m8p8sq1yx2dk4q05ft3ztfg.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742433/development/ks7lbns8cqca341veqz378squhvf.jpg"],
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742436/development/up3k8m8p8sq1yx2dk4q05ft3ztfg.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742433/development/ks7lbns8cqca341veqz378squhvf.jpg"],
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742436/development/up3k8m8p8sq1yx2dk4q05ft3ztfg.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742433/development/ks7lbns8cqca341veqz378squhvf.jpg"],
# ["https://res.cloudinary.com/dgellsobw/image/upload/v1677742436/development/up3k8m8p8sq1yx2dk4q05ft3ztfg.jpg", "https://res.cloudinary.com/dgellsobw/image/upload/v1677742433/development/ks7lbns8cqca341veqz378squhvf.jpg"]
# ]
# listings.each do |listing|
#   # file = URI.open(files[i][0])
#   # file2 = URI.open(files[i][1])
#   file = URI.open("https://source.unsplash.com/random/?surfer")
#   file2 = URI.open("https://source.unsplash.com/random/?surfer")
#   puts "Attaching photo 1 of ##{i}"
#   listing.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
#   listing.save
#   puts "Attaching photo 2 of ##{i}"
#   listing.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
#   listing.save
#   i+=1
# end
