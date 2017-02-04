require 'rails_helper'

RSpec.describe Pin, type: :model do
  describe 'validations' do
    it { is_expected.to validate_numericality_of :lat }
    it { is_expected.to validate_numericality_of :lng }
    it { is_expected.to validate_numericality_of :creator_id }
    it { is_expected.to validate_presence_of :appeal }
  end

  describe 'associations' do
    it { is_expected.to belong_to :creator }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :pin_tags }
  end
end
