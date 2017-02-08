
class Pin < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  has_many :pintags
  has_many :tags, -> { distinct }, through: :pintags

  validates_presence_of :user_id, :lat, :lng, :appeal, :name
  validates_numericality_of :user_id, :lat, :lng

  mount_uploader :image, ImageUploader

  def self.tags_to_s(pin)
  	return "" if !pin.pintags
    tag_names = ""
  	pin.pintags.each do |pt|
      tag_result = Tag.find_by(id: pt.tag_id)
      if tag_result
        tag_names << "#{tag_result.label}, "
      end
  	end
  	tag_names.chomp(', ')
  end

end
