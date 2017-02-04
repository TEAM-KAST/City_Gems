require 'rails_helper'

RSpec.describe PinTagVote, type: :model do
  describe 'validations' do
    it { is_expected.to validate_numericality_of :user_id}
    it { is_expected.to validate_numericality_of :pintag_id}
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :pintag_id }
  end

  describe 'associations' do
   it { is_expected.to belong_to :user }
   it { is_expected.to belong_to :pintag }
  end
end
