# require 'faker'

class User < ApplicationRecord
  

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  # I would like to give the user a username since we cannot get that from Google
  # def username
  #   "Faker::Pokemon.name"
  # end

  # I would also like to give them the option to change it
  # def username=(new_username)
  #   username = new_username
  #   username
  # end

end
