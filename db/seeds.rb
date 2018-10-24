require 'faker'
# city_size = ["small", "medium", "large"]

# CS.countries.each do |c_code, name|
#   c = Country.create(name: name)
#     CS.get(c_code).each do |s_code, s_name|
#      CS.get(c_code, s_code).each do |city|
#       City.create(name: city, size: city_size.sample, country_id: c.id, state_code: s_code)
#     end
#   end
# end

# 20.times do
#   pass = Faker::Internet.password
#   User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name, email: Faker::Internet.free_email , password: pass, password_confirmation: pass )
# end
# puts "Done seeding users."

reviews = ["Frankly, Manhattan is pretty much an over hyped total joke that during a very recent visit was just as bad as I recalled from the last time I had been there about 20 years earlier.  Everywhere you go, it stinks to the high heavens like many other 3rd World cities I have been to in Asia, Africa and South America-it just hits you around almost every corner.  Additionally, it is dirty, dingy with trash strewn everywhere and most of the architecture is just plain ugly.  I was there for 3 days and not once did I see an actual city municipal worker anywhere at all-no one is cleaning up anything ever like real world class beautiful cities like San Francisco or Barcelona.  And the traffic is beyond brutal compared to those two cities for example.", "LOVE , love, love this place.  I have only explored Times Square, Coney Island and Hells Kitchen .  So much to see and do !  I love people watching.  Its the best ever.  The men dress to the nines .  UUmmmm!
The little cafes and street vendor's are so tasty and interesting .  I stayed at the Novotel and it was a great location.  I highly recommend the Hop On and Hop Off Greyline Tours.  You get to see so much and learn a lot at the same time. Take in as many Broadway show's as you can.  Central Park is so awesome.  I went to the taping of the View and it was fantastic.  Lots of TV show's are being taped and ofcourse the news in Rockefeller Center too.", "Such an amazing city. That first time feeling driving into the city and seeing the familiar skyline that I've seen in movies was amazing. Took an overpriced can the first time, bus the second and subway the third. Much easier on the subway. So much to do, so many miles to walk, so much to see. Some of the best times spent here. Most of my money spent here was in foot care products from Duane Reed. Wear the most comfortable shoes ever or your feet will pay the price."]

### NY, Kuala Lumpur, Montreal
city_ids = [68853, 50899, 9158]
user_id = 1
ratings = (1..5).to_a
years = (2015..2018).to_a
months = (1..12).to_a
days = (1..28).to_a

Review.delete_all
puts "Deleted all old reviews"

10.times do
  Review.create(rating: ratings.sample, content: reviews.sample, date_visited: "#{years.sample}-#{months.sample}-#{days.sample}", user_id: user_id, city_id: city_ids.sample)

  Review.create(rating: ratings.sample, content: reviews.sample, date_visited: "#{years.sample}-#{months.sample}-#{days.sample}", user_id: user_id, city_id: city_ids.sample)

  Review.create(rating: ratings.sample, content: reviews.sample, date_visited: "#{years.sample}-#{months.sample}-#{days.sample}", user_id: user_id, city_id: city_ids.sample)

  user_id += 1
end
puts "DONE SEEDING"
