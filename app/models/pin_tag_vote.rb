class PinTagVote < ApplicationRecord
  belongs_to :pintag
  belongs_to :user

  validates :user_id, :pintag_id, presence: true
  validates :user_id, :pintag_id, numericality: true
end
