# require 'faker'
class User < ApplicationRecord
  has_many :pins
  has_many :comments
  has_many :commented_pins, -> { distinct }, through: :comments, source: :pin

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

end
