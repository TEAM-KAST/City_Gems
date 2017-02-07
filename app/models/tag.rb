class Tag < ApplicationRecord
  has_many :pintags

  TAGS = %w(Natural Historical Artistic Quirky Cultural Beautiful)

  validates :label, presence: true,
    inclusion: { in: TAGS, message: "%{value} is not one of the tags" }

end
