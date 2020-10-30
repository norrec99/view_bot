
require "open-uri"
require 'date'
require "faker"
categories = ["Frontend", "Backend", "Design", "Good", "Bad"] 
puts "Cleaning the database"

ReviewTag.destroy_all
Tag.destroy_all
Review.destroy_all
User.destroy_all
Application.destroy_all
Tag.destroy_all


# application = Application.create!(name: Faker::App.name )
# categories.each do |category|
#   tag = Tag.create!(name: category)
# end
application1 = Application.create!(name: "Facebook" )
categories.each do |category|
  tag = Tag.create!(name: category)
end
application2 = Application.create!(name: "Instagram" )
categories.each do |category|
  tag = Tag.create!(name: category)
end
application3 = Application.create!(name: "Twitter" )
categories.each do |category|
  tag = Tag.create!(name: category)
end
application4 = Application.create!(name: "Tik Tok" )
categories.each do |category|
  tag = Tag.create!(name: category)
end
application5 = Application.create!(name: "Zoom" )
categories.each do |category|
  tag = Tag.create!(name: category)
end




user1 = User.create!( password: "123456", email: "hotmale@hotmail.com", application: application1)
user2 = User.create!( password: "123456", email: "lastsamurai@earth.com", application: application1)
user3 = User.create!( password: "123456", email: "happylittlebug@email.com", application: application1)
user4 = User.create!( password: "123456", email: "crazy_nerd@email.com", application: application1)
user5 = User.create!( password: "123456", email: "supernerd@email.com", application: application1)
puts "Creating #{User.count} users"

15.times do
review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(0..5), title: Faker::Marketing.buzzwords, content: Faker::Quote.matz, user: user1, application: application1 )
review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(0..5), title: Faker::Marketing.buzzwords, content: Faker::Quote.matz, user: user2, application: application2 )
review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(0..5), title: Faker::Marketing.buzzwords, content: Faker::Quote.matz, user: user3, application: application3 )
review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(0..5), title: Faker::Marketing.buzzwords, content: Faker::Quote.matz, user: user4, application: application4 )
review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(0..5), title: Faker::Marketing.buzzwords, content: Faker::Quote.matz, user: user5, application: application5 )
end

puts "Creating #{Application.count} applications"
puts "Creating #{Review.count} reviews"
puts "Finished!"

