class PinTag < ApplicationRecord
  belongs_to :pin
  belongs_to :tag

  validates :pin_id, :tag_id, numericality: true
end
