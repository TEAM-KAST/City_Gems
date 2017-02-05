class Tag < ApplicationRecord
  has_many :pin_tags

  TAGS = %w(natural historical artistic quirky beautiful cultural)

  validates :label, presence: true,
    inclusion: { in: TAGS, message: "%{value} is not one of the tags" }

end
