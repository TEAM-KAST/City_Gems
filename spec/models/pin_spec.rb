require 'rails_helper'

RSpec.describe Pin, type: :model do
  describe 'validations' do
    xit { is_expected.to validate_numericality_of :lat }
    xit { is_expected.to validate_numericality_of :lng }
    xit { is_expected.to validate_numericality_of :manufacturer_id }
    xit { is_expected.to validate_presence_of :appeal }
  end

  describe 'associations' do
    xit { is_expected.to belong_to :creator }
    xit { is_expected.to have_many :comments }
    xit { is_expected.to have_many :tags }
  end
end
