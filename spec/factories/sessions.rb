FactoryGirl.define do
  factory :user do
    provider "google"
    uid "12345678910"
    email "jesse@mountainmantechnologies.com"
    first_name "Jesse"
    last_name "Spevack"
    token "abcdefg12345"
    refresh_token "12345abcdefg"
    oauth_expires_at DateTime.now
  end
end
