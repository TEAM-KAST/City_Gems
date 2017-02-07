require 'rails_helper'

RSpec.describe Pintag, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:pin) }
    it { is_expected.to belong_to(:tag) }
  end
end
