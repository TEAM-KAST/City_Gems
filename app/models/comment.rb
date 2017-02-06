class Comment < ApplicationRecord
  # belongs_to :pin
  belongs_to :user

  validates :content, :user_id, :pin_id, presence: true
  validates :user_id, :pin_id, numericality: true
end
