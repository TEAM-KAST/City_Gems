FactoryGirl.define do
  factory :pin do
    user
    name "Something Pretty"
    appeal "ItisreallyprettyIlikeit."
    photo_url "www.image.url"
    website "www.reallypretty.like"
    lat 47.5979520
    lng -122.3349440
    image "photo.jpg"
    width "50"
    height "50"
  end
end
