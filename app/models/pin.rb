class Pin < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :pin_tags

  validates_presence_of :user_id, :lat, :lng, :appeal, :name
  validates_numericality_of :user_id, :lat, :lng

  def self.tags(pin)
  	tag_names = ""
  	pin.pin_tags.each do |pt|
  		tag_names << "#{Tag.find_by(id: pt.tag_id).label}, "
  	end
  	tag_names.chomp(', ')
  end

end
