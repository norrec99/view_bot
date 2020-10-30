
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

# attaching the photos
file = URI.open('https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2Foriginals%2Fd7%2Fc1%2Fd0%2Fd7c1d07b8d763870d4b59c10603ed092.png&imgrefurl=https%3A%2F%2Fin.pinterest.com%2Fpin%2F730849845759856038%2F&tbnid=4l2PhapPyk8M2M&vet=12ahUKEwjOnM-BltzsAhUL4RoKHYZ3BJMQMygBegUIARDHAQ..i&docid=A3hcbIGtwtodYM&w=640&h=640&q=facebook%20icon%20image&client=firefox-b-d&ved=2ahUKEwjOnM-BltzsAhUL4RoKHYZ3BJMQMygBegUIARDHAQ')
application1.photo.attach(io: file, filename: 'facebook.jpg', content_type: 'image/png')

file = URI.open('https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.flaticon.com%2Fsvg%2Fstatic%2Ficons%2Fsvg%2F174%2F174855.svg&imgrefurl=https%3A%2F%2Fwww.flaticon.com%2Ffree-icon%2Finstagram_174855&tbnid=iWR3UvauKIkhEM&vet=12ahUKEwjTiMmkltzsAhUNNBoKHQLiAtkQMygHegUIARDcAQ..i&docid=yogcCVKNTLHJvM&w=800&h=800&q=instagram%20icon%20photo&hl=en&client=firefox-b-d&ved=2ahUKEwjTiMmkltzsAhUNNBoKHQLiAtkQMygHegUIARDcAQ')
application2.photo.attach(io: file, filename: 'instagaram.jpg', content_type: 'image/png')

file = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Ficons-for-free.com%2Fsocial%2Btweet%2Btwitter%2Bicon-1320192248146512175%2F&psig=AOvVaw2v-pRLtjnode7gcpoT3iH6&ust=1604142469992000&source=images&cd=vfe&ved=2ahUKEwiG4YHCltzsAhVMwuAKHe29BkYQjRx6BAgAEAc')
application3.photo.attach(io: file, filename: 'twitter.jpg', content_type: 'image/png')

file = URI.open('data:image/png;base64,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')
application4.photo.attach(io: file, filename: 'TikTok.jpg', content_type: 'image/png')

file = URI.open('https://www.google.com/imgres?imgurl=http%3A%2F%2Fassets.stickpng.com%2Fthumbs%2F5e8ce318664eae0004085461.png&imgrefurl=https%3A%2F%2Fwww.stickpng.com%2Fimg%2Ficons-logos-emojis%2Fvideo-conference-software-providers%2Fzoom-icon-logo&tbnid=AxGZg_MMAJdoCM&vet=12ahUKEwibkuvyltzsAhXBwIUKHQ2iBgUQMygAegUIARDUAQ..i&docid=8CfwYW8a7HGCLM&w=300&h=300&q=zoom%20icon%20photo&hl=en&client=firefox-b-d&ved=2ahUKEwibkuvyltzsAhXBwIUKHQ2iBgUQMygAegUIARDUAQ')
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

