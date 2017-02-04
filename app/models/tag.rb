class Tag < ApplicationRecord
  has_many :pintags
  validates :name, presence: true
end
