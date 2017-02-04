FactoryGirl.define do
  factory :user do
    provider "google"
    uid "12345678910"
    name "Jesse Spevack"
    oauth_token "abcdefg12345"
    oauth_expires_at DateTime.now
  end
end
