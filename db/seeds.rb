require 'faker'

30.times {User.create(Omniauth.google)}
200.times {
  Pin.create(user_id: Random.rand(30), appeal: Faker::HarryPotter.quote, photo_url: Faker::Avatar.image, website: Faker::Internet.url )
}
300.times {
  Comment.create(user_id: Random.rand(30), content: Faker::StarWars.quote, pin_id: Random.rand(200) )
}
