class Tag < ApplicationRecord
  has_many :pin_tags

  TAGS = %w(Natural Historical Artistic Quirky Cultural Beautiful)

  validates :label, presence: true,
    inclusion: { in: %w(Natural Historical Artistic Quirky Cultural Beautiful), message: "%{value} is not one of the tags" }

end
