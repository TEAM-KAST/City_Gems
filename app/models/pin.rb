class Pin < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :pin_tags
end
