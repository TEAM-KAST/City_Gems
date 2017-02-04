class Tag < ApplicationRecord
  has_many :pintags
  validates :label, presence: true
end
