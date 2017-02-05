require 'faker'
require 'random-location'

Pin.delete_all
Comment.delete_all
Tag.delete_all

Tag.create(label: "Quirky")
Tag.create(label: "Historical")
Tag.create(label: "Beautiful")
Tag.create(label: "Delicious")
Tag.create(label: "Inspiring")
Tag.create(label: "Chill")

Pin.create(user_id: 1, appeal: "It's one of the most beautiful spots in Washington...", photo_url: "https://swwhitaker.github.io/images/whitaker_snoqualmie.jpg", website: "stephenwhitakerimages.com", lat: 47.541721, lng: -121.837702)

200.times {
  Pin.create(user_id: Random.rand(5), appeal: Faker::StarWars.quote,
    photo_url: Faker::Avatar.image,
    website: Faker::Internet.url,
    lat: RandomLocation.near_by(47.5979520, -122.3349440, 1000)[0],
    lng: RandomLocation.near_by(47.5979520, -122.3349440, 1000)[1] )
}

300.times {
  Comment.create(user_id: Random.rand(30), content: Faker::StarWars.quote, pin_id: Random.rand(200) )
}
