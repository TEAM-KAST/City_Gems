class Pin < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :pin_tags

  validates_presence_of :user_id, :lat, :lng, :appeal
  validates_numericality_of :user_id, :lat, :lng

  def self.tags(pin)
  	tagnames = ""
  	pin.pin_tags.each do |pt|
  		tagnames << Tag.find_by(id: pt.tag_id).label + ", "
  	end 
  	tagnames.chomp(', ')
  end

end
