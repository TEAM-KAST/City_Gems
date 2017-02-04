class Tag < ApplicationRecord
  has_many :pin_tags
  validates :label, presence: true
end
