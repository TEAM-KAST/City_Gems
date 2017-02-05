class Pin < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :pin_tags

  validates_presence_of :user_id, :lat, :lng, :appeal
  validates_numericality_of :user_id, :lat, :lng
end
