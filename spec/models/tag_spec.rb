require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'tag associations' do
    xit { is_expected.to have_many(:pintags)}
    it { is_expected.to validate_presence_of(:label) }
  end
end
