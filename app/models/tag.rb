class Tag < ApplicationRecord
  has_many :pin_tags

  TAGS = %w(Natural Historical Artistic Quirky Beautiful Cultural)

  validates :label, presence: true,
    inclusion: { in: TAGS, message: "%{value} is not one of the tags" }

end
