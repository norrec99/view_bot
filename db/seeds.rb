
require "open-uri"
require 'date'
require "faker"
categories = ["Frontend", "Backend", "Design", "Bad", "Good"] 
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

file = URI.open('https://neilpatel.com/wp-content/uploads/2017/08/instagram-1.jpg')
application2.photo.attach(io: file, filename: 'instagaram.jpg', content_type: 'image/png')

file = URI.open('https://thekashmiriyat.co.uk/wp-content/uploads/2020/07/unnamed.png')
application3.photo.attach(io: file, filename: 'twitter.jpg', content_type: 'image/png')

file = URI.open('https://i.pinimg.com/474x/27/2d/df/272ddfccb6bb6161a6a9364ffc3703d7.jpg')
application4.photo.attach(io: file, filename: 'TikTok.jpg', content_type: 'image/png')

file = URI.open('https://i1.wp.com/allthings.how/wp-content/uploads/2020/04/allthings.how-how-to-change-zoom-background-on-iphone-and-ipad-zoom-logo-2.png?w=1200&ssl=1')
application5.photo.attach(io: file, filename: 'zoom.jpg', content_type: 'image/png')


user1 = User.create!( password: "123456", email: "ozanisgor@hotmail.com", application: application1)
user2 = User.create!( password: "123456", email: "cagataysoyer@gmail.com", application: application1)
user3 = User.create!( password: "123456", email: "leena@gmail.com", application: application1)
user4 = User.create!( password: "123456", email: "syrashid@gmail.com", application: application1)
user5 = User.create!( password: "123456", email: "nicoproto@gmail.com", application: application1)
puts "Creating #{User.count} users"


467.times do
  review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(2..3), title: Faker::Marketing.buzzwords, content: Faker::Restaurant.review, user: user1, application: application1 )
end 
review1 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 1, title: Faker::Marketing.buzzwords, content: "Okay so this actually isn't a bad app. It runs better than the desktop site and barely drains battery at all. But I'll explain in 4 points what it would take to get 5 stars, they get an extra star for each one they do. 1. Dark mode. 2. The default option for the news feed should be an unadulterated 'most recent' feed. 3. No more targeted ads. You've done enough damage to society. 4. Actually ban edgy right wing people, and no, 'cracker' is not a slur.", user: user1, application: application1 )
reviewSpecial = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 1, title: Faker::Marketing.buzzwords, content: "I WANT DARK MODEEEEE !!!!! all the other apps have it why not yours?", user: user1, application: application1 )
review2 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 4, title: Faker::Marketing.buzzwords, content: "I am using FB more than 7 years. It is an excellent social platform for me to connect with people. However I do face some bad experience in recent days. I have shown with some irrelevant ads repeatedly which I blocked many times. Also I have shown with some celebrity pages and posts. When I open that page, it shows that I had liked that page before which I never did. It shows the pages as I follow which I never did. Some times it is too irritational. Please do the needful.", user: user1, application: application1 )
review3 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 1, title: Faker::Marketing.buzzwords, content: "The app works great unless you dare to say anything contrary to the liberal agenda. Expect a lot of censorship, revoking of advertising, and even blocking of your account if you express anything rightwing or moderate. Its a pity, because Facebook used to be a great place where all ideas could be shared and discussed. Now, you can only share and discuss PC ideas or face repercussions. Imagine such a structure when we discovered the earth was a sphere. Oh right. This is exactly what happened then.", user: user1, application: application1 )
review4 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 3, title: Faker::Marketing.buzzwords, content: "I don't know if this is peculiar to my phone (Samsung galaxy S9 plus). Facebook app keeps logging me out every now and then. Even while online, the app terminates my session and logs me out. I have done all kinds of reset and troubleshooting on my device, the issue still persists. I have sent email to Facebook, even reported the issue via the app, I haven't received any feedback for weeks now. Any idea of the cause? Any solution?", user: user1, application: application1 )
review5 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 3, title: Faker::Marketing.buzzwords, content: "Only issue I have is that when I click on a video and I'm into it, it will exit out of the video and load new ones when I click on it again so I can never finish what I was watching before. Its really irritating. That and when I talk about something (not on facebook) facebook always has ads pop up that are related to it. It's creepy. Quit spying on meeeeeee.", user: user1, application: application1 )
review6 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 1, title: Faker::Marketing.buzzwords, content: "The last update, as typical, made my experience worse. Sending to different screen to hide ads. Way older posts showing first. Many friend post not even displayed. Still allowing lots of false information. Now if I go into comment, when I get out, back up at top of newsfeed. Then have to spend many minutes scrolling back to where I was. Just an awful install!", user: user1, application: application1 )
review7 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 3, title: Faker::Marketing.buzzwords, content: "Been using it for a long time, now when you are playing video in full screen or just tapping the video, you can no longer choose the quality of the video. Its annoying because the default quality for the full screen is i think 240p i cant watch clearly. Pls fix this issue, and i suggest you add a default quality when playing video in facebook settings.", user: user1, application: application1 )
review8 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 2, title: Faker::Marketing.buzzwords, content: "Video playback has become really annoying with Ad integration every time in watching a video the screen will either fade to black and stay that way in place of an ad (not appearing and no ad sounds) meaning the video has to be restarted or the video will repeat the last second or two after fading to black. With the advert companies details then appearing under the video. Sort it out", user: user1, application: application1 )
review9 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 5, title: Faker::Marketing.buzzwords, content: "I Love it because I have found people that I haven't seen in decades. And you can really keep in touch your family and friends. Chat face to face. Especially with the Coivd 19 going. I just think Facebook is the best App. They have ever came out with. I don't think anything could ever top it. So I Just want to thank the Guy Who invented Facebook. Thank you So Very, Very, Very, Very Much. Sincerely Blanche Gilbert : Family, and Friends.", user: user1, application: application1 )
review10 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 5, title: Faker::Marketing.buzzwords, content: "Facebook has most always been kind to me. I support them 100%, the team of teams has helped me in the past and in the present on so many different issues, it's a great big deal to me having FACEBOOK help center and FACEBOOK security service's to count on when your in a bind in. I appreciate all of you and above al I trust you, and that for me is a very tall order.. have fun, be safe and stay healthy. From one facebooker to another love you!! Thanks for all your help ALL OF YOU ARE BRILLIANT!! NO", user: user1, application: application1 )
review11 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 4, title: Faker::Marketing.buzzwords, content: "Good day. Prior to this update, (in the FB Messenger room) tapping on the top right hand menu option (the star shaped icon) it doesn't work. When I found an FB app update, updated it at once. I tried to access the settings, tapping on the top right hand menu option (the star shaped icon), now it is working absolutely fine. I appreciate it so much because this is a very useful option/feature. Thank you FB Group for the quick response of fixing the problem at once.", user: user1, application: application1 )
review12 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 4, title: Faker::Marketing.buzzwords, content: "Though facebook is my favourite social media, it has some problems to be fixed soon. Like there is no dark mode available for all. There should be a option to cutomize all reacts on Facebook. And there is so many ads. Messenger seems to change its colour to purple. I think facebook app's colour should be purple. And the most important thing is If I lock my profile, I can't use picture guard. And there should be a option for cover photo guard. I hope Facebook will work on it as soon as possible", user: user1, application: application1 )
review13 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 5, title: Faker::Marketing.buzzwords, content: "Best social media app ever experienced. This app has fast connection. No ads, and no bugs. This makes it easier to load in fast. You can even live stream and create rooms. You devs keep up the good work. I'm really enjoying this good app. Really works on my Samsung Galaxy j7 crown. Thanks for making the app easy to use. 5 stars from me 👍👍👍👍", user: user1, application: application1 )
review14 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 1, title: Faker::Marketing.buzzwords, content: "The latest 'look' to the fb app (Galaxy Tab S4) leaves much to be desired... There's also a glitch, I use my tablet in landscape and every time I try to share an article fb marked as covid related it permanently rotates fb to portrait until I close it, clear it from memory and open it again, it's been doing it ever since they started marking articles as covid related.", user: user1, application: application1 )
review15 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 1, title: Faker::Marketing.buzzwords, content: "It keeps logging me out every 5 mins saying my password has been changed but it hasn't. I can log back it then it logs me back out. It's been doing this for over a month now and I've reported it to their imaginary customer service and of course, no response.🙄 They have started banning people for notthing. Certain words in their algorithm will get your account deleted now. Better not talk about his daddy Trump. 😒 Switching to MeWe or LIKER. I heard it's popping over there.", user: user1, application: application1 )
# twitter reviews

review16 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 3, title: Faker::Marketing.buzzwords, content: "It was such a good social media app.... Now I dunno what happened. The notifications doesn't work, I repeatedly have to verify who I am and I can't see my number of followers and following. But most importantly, the notifications. That's the quintessential part! Please fix it.... I wanna see the notifications on my screen. This update really messed everything up....", user: user1, application: application3 )
review17 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 2, title: Faker::Marketing.buzzwords, content: "This app used to be one of the most used of my cellphone. But this lady update literally RUINED the app, I've lost two accounts because of the verification 'you're a robot?'. You ask to put my phone number to verification but then, appears a message saying that the number is already in use. Of course it is! I just have one phone number, of course that it is in all of my accounts. Fix it, we won't change number for the accounts just because you want us to do this.", user: user1, application: application3 )
review18 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 3, title: Faker::Marketing.buzzwords, content: "I have a lot of issues with twitter currently. I rated it 3 stars becuase there's a lot of bugs and things I personally dislike. I haven't really had any bugs but it does annoy me that I don't have voice tweets yet but a few of my friends do and there doesn't seem to be any criteria for getting them. I don't like the one picture limit in dms or the new rt system at all. Other than that it works pretty well but twitter refuses to acknowledge the pedophilia problem.", user: user1, application: application3 )
review19 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 4, title: Faker::Marketing.buzzwords, content: "this app is good, I liked the developers trying to improve it day by day. I just want to recommend that they try to bring the retweet button back into the last version. This time when you use the retweet button it takes you to a quoted tweet format, it's kinda annoying. It's much better if retweet and quote tweet is separated though, that's all. Overall this was a good platform to use 😄", user: user1, application: application3 )
review20 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 1, title: Faker::Marketing.buzzwords, content: "I used to really love twitter. honestly, it was the best platform for me. But these days twitter keeps suspending accounts, even those who didn't violate rules and just ??? suspended them. This was something irritating to me, because I didn't do anything wrong and yet I got suspended. So many people experienced this and it also made twitter less enjoyable to them, to me personally who have been using it for years. This year has been the worst year of all times, accounts got shadowbanned easily.", user: user1, application: application3 )
review21 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 4, title: Faker::Marketing.buzzwords, content: "After today's update font size is the smallest possible. There is no option to change it in app and increasing it in the phone settings (Android) changes nothing in the app itself. It feels almost unpleasant to read the tweets in such small font size. Great, the font is normal now, thanks. But the auto refresh... you just need to remove that feature. You don't want to be like Facebook. I rarely use them because of this.", user: user1, application: application3 )
review22 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 4, title: Faker::Marketing.buzzwords, content: "Its a good app. There are things they can do to improve it. For example, when you are viewing someone's 'followers' and decide to look at a followers profile, you lose your place when you go back to viewing 'followers'. The system forces you to start at the beginning of the followers list, again, which requires you to scroll down the same list of names to pick-up where you left off, before checking someone's profile. It's an irritating waste of time!", user: user1, application: application3 )
review23 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 5, title: Faker::Marketing.buzzwords, content: "This app has become my favorite social media app since the day I first used it. However, something happened when I updated this app earlier this morning. I cannot retweet normally like I used to. Every time I press the retweet button, it becomes a quote tweet. I just want to retweet the tweets. I don't know if the fault is in my phone or the app itself. Please help me.", user: user1, application: application3 )
review24 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 4, title: Faker::Marketing.buzzwords, content: "I like Twitter a lot. it's easy to use, keeps me up to date, and doesn't have many glitches. But I've been having some problems lately. I don't get notifications for users I turned notifs on for. I only get notified for one of the people I have notifs for, and the rest I don't. my twitter notifications are enabled on a system level, I tried turning notifications off and back on for the user. I don't know what's up with it but that's the only thing I've noticed lately.", user: user1, application: application3 )
review25 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 5, title: Faker::Marketing.buzzwords, content: "2 Edits below original post.........After the last update I am unable to post videos from my gallery or send a message to support or file a report through the app. I have uninstalled and reinstalled twice to no avail. Please help. Edit: It appears that a video will post but when it does it is a bright green color and has static. You don't see the video at all. Last Edit: It's fixed! I'm not sure if it was a glitch and it fixed itself or if tech support did it. In any case, thanks much!!!!", user: user1, application: application3 )
review26 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 1, title: Faker::Marketing.buzzwords, content: "MineApp is super super better than Twitter. Hello Twitter team when I started using this app for first time I have created many accounts in one phone number and I tried to delete them but when I tried to login to those it shows many accounts in this number and says to enter user name but I did not know the user name and I have not connected to email account to it.so help me and fix the bugs in this app.", user: user1, application: application3 )
review27 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 2, title: Faker::Marketing.buzzwords, content: "Targets wrong location. I keep getting ads in Italian and when I check to see why I'm seeing them, it says it's because my location is in Italy. But it's not. My settings say US. My language is English. My vpn isn't going through Italy or anything like that. I've sent several tickets trying to fix it and nothing has worked. It always somehow defaults back to trying to do trends and news that is 'local' to Italy. I'm installing until it's fixed.", user: user1, application: application3 )
  387.times do
    twitter_review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(2..3), title: Faker::Marketing.buzzwords, content: Faker::Restaurant.review, user: user1, application: application3 )
  end 
  # Instagram reviews
review28 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 2, title: Faker::Marketing.buzzwords, content: "I have logged into Instagram from 2 accounts. One of them i use a lot. The other one not so much. The second one doesn't update and for some reason, i cannot see the likes in that account. Its very annoying since i never even signed up for that 'experiment' and I'm trying to undo it but there's no option to do that either!! Give me an option to get my likes back and I'll give you 5 stars.", user: user1, application: application2 )
  423.times do
    instagram_review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(1..5), title: Faker::Marketing.buzzwords, content: Faker::Restaurant.review, user: user1, application: application2 )
  end 
  # Tik Tok reviews
review29 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 5, title: Faker::Marketing.buzzwords, content: "Its simple and fun to use. Kids love jumping onto some trends. The only issue I have is that videos dont get views. Reported it so many times.. its just been happening since joining the account. I've seen others who have really poor quality videos get so many views and likes on their account. I've even deleted and reinstalled the tik tok app. Would be nice if there was a way to check what's going on.", user: user1, application: application4 )
521.times do
  tiktok_review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(1..5), title: Faker::Marketing.buzzwords, content: Faker::Restaurant.review, user: user1, application: application4 )
end 
# Zoom reviews
review30 = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: 4, title: Faker::Marketing.buzzwords, content: "This app is very nice but there are one issue when my video is on and I am going to participant list it showing my video is off. It is a very big issue for my online classes. As a student it is very big issue . Please fix it .I think in the next update it can work and the video problem fix and the zoom will be really ready for rating 5 stars .please fix it.", user: user1, application: application5 )
535.times do
  zoom_review = Review.create!(reviewer_name:Faker::Name.name, location: Faker::Address.city, store_name: "Play Store", language: 'English', reviewed_at: Faker::Date.forward(days: 23),  link: Faker::Internet.url, rating: rand(2..3), title: Faker::Marketing.buzzwords, content: Faker::Restaurant.review, user: user1, application: application5 )
end 




puts "Creating #{Application.count} applications"
puts "Creating #{Review.count} reviews"
puts "Finished!"

