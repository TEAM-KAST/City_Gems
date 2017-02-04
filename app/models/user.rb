# require 'faker'

class User < ApplicationRecord
  has_many :pins
  has_many :comments
  # has_many :votes

  def self.update_or_create(auth)
      user = User.find_by(uid: auth[:uid]) || User.new
      user.attributes = {
        provider: auth[:provider],
        uid: auth[:uid],
        email: auth[:info][:email],
        first_name: auth[:info][:first_name],
        last_name: auth[:info][:last_name],
        token: auth[:credentials][:token],
        refresh_token: auth[:credentials][:refresh_token],
        oauth_expires_at: auth[:credentials][:expires_at]
      }
      user.save
      user
    end

  # I would like to give the user a username since we cannot get that from Google
  def username

  end

  # I would also like to give them the option to change it
  def username=(new_username)
    username = new_username
  end

end
