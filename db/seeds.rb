require 'faker'
require 'random-location'

Pin.delete_all
Comment.delete_all


200.times {
  Pin.create(user_id: Random.rand(30), appeal: Faker::StarWars.quote,
    photo_url: Faker::Avatar.image,
    website: Faker::Internet.url,
    lat: RandomLocation.near_by(47.5979520, -122.3349440, 1000)[0],
    lng: RandomLocation.near_by(47.5979520, -122.3349440, 1000)[1] )
}

300.times {
  Comment.create(user_id: Random.rand(30), content: Faker::StarWars.quote, pin_id: Random.rand(200) )
}
