
require "open-uri"
require 'date'
require "faker"

puts "Cleaning the database"

Review.destroy_all
User.destroy_all
Application.destroy_all

user1 = User.create( password: "123456", email: "email1@email.com")
user2 = User.create( password: "123456", email: "email2@email.com")
user3 = User.create( password: "123456", email: "email3@email.com")
user4 = User.create( password: "123456", email: "email4@email.com")

puts "Creating #{User.count} users"
15.times do
application = Application.create(name: Faker::App.name )
review = Review.create!(reviewer_name:Faker::Name.name, status: "pending", location: Faker::Address.city, store_name:Faker::App.name, language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(0..5), title: Faker::Marketing.buzzwords, content: Faker::Quote.matz, user: user1, application: application )
review = Review.create(reviewer_name:Faker::Name.name, status: "pending", location: Faker::Address.city, store_name:Faker::App.name, language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(0..5), title: Faker::Marketing.buzzwords, content: Faker::Quote.matz, user: user2, application: application )
review = Review.create(reviewer_name:Faker::Name.name, status: "pending", location: Faker::Address.city, store_name:Faker::App.name, language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(0..5), title: Faker::Marketing.buzzwords, content: Faker::Quote.matz, user: user3, application: application )
review = Review.create(reviewer_name:Faker::Name.name, status: "pending", location: Faker::Address.city, store_name:Faker::App.name, language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(0..5), title: Faker::Marketing.buzzwords, content: Faker::Quote.matz, user: user4, application: application )
end
puts "Creating #{Application.count} applications"
puts "Creating #{Review.count} reviews"
puts "Finished!"

