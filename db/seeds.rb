require 'faker'

Pin.delete_all
Comment.delete_all
Tag.delete_all
PinTag.delete_all

Tag.create(label: "Natural")
Tag.create(label: "Historical")
Tag.create(label: "Artistic")
Tag.create(label: "Quirky")
Tag.create(label: "Beautiful")
Tag.create(label: "Cultural")

Pin.create(user_id: 1, name: "Snoqualmie Falls", appeal: "It's one of the most beautiful spots in Washington...", photo_url: "https://swwhitaker.github.io/images/whitaker_snoqualmie.jpg", website: "stephenwhitakerimages.com", lat: 47.541721, lng: -121.837702)

PinTag.create(pin_id: 1, tag_id: 1)
PinTag.create(pin_id: 1, tag_id: 5)

10.times {
  Pin.create(user_id: 1, name: Faker::Hipster.sentences(1)[0], appeal: Faker::StarWars.quote,
    photo_url: Faker::Avatar.image,
    website: Faker::Internet.url,
    lat: 47.5979520,
    lng: -122.3349440 )
}

10.times {
  Comment.create(user_id: 1, content: Faker::StarWars.quote, pin_id: Random.rand(8) )
}

30.times {PinTag.create(tag_id: Random.rand(6), pin_id: Random.rand(8))}
