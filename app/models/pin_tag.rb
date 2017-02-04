class PinTag < ApplicationRecord
  belongs_to :pin
  belongs_to :tag
  has_many :pin_tag_votes

  validates :pin_id, :tag_id, numericality: true
end
