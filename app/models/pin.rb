class Pin < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :pintags

  validates_presence_of :user_id, :lat, :lng, :appeal, :name
  validates_numericality_of :user_id, :lat, :lng

  def self.tags(pin)
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
