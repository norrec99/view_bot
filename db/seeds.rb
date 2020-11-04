
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
categories.each do |category|
  tag = Tag.create!(name: category)
end
application1 = Application.create!(name: "Facebook" )

application2 = Application.create!(name: "Instagram" )

application3 = Application.create!(name: "Twitter" )

application4 = Application.create!(name: "Tik Tok" )

application5 = Application.create!(name: "Zoom" )


# attaching the photos
file = URI.open('https://www.personalcomputerfixes.com/wp-content/uploads/2011/03/fb-hero-image-001.jpeg')
application1.photo.attach(io: file, filename: 'facebook.jpg', content_type: 'image/png')

file = URI.open('https://seeklogo.net/wp-content/uploads/2016/05/instagram-logo-vector-download.jpg')
application2.photo.attach(io: file, filename: 'instagaram.jpg', content_type: 'image/png')

file = URI.open('https://thekashmiriyat.co.uk/wp-content/uploads/2020/07/unnamed.png')
application3.photo.attach(io: file, filename: 'twitter.jpg', content_type: 'image/png')

file = URI.open('https://i.pinimg.com/474x/27/2d/df/272ddfccb6bb6161a6a9364ffc3703d7.jpg')
application4.photo.attach(io: file, filename: 'TikTok.jpg', content_type: 'image/png')

file = URI.open('https://i1.wp.com/allthings.how/wp-content/uploads/2020/04/allthings.how-how-to-change-zoom-background-on-iphone-and-ipad-zoom-logo-2.png?w=1200&ssl=1')
application5.photo.attach(io: file, filename: 'zoom.jpg', content_type: 'image/png')


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

