class PinTagVote < ApplicationRecord
  belongs_to :pin_tag
  belongs_to :user

  validates :user_id, :pin_tag_id, presence: true
  validates :user_id, :pin_tag_id, numericality: true
end
