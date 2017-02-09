require 'rails_helper'

RSpec.describe Pin, type: :model do

  describe 'validations' do
    it { is_expected.to validate_numericality_of :lat }
    it { is_expected.to validate_numericality_of :lng }
    it { is_expected.to validate_numericality_of :user_id }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :appeal }
    it { is_expected.to validate_presence_of :lat }
    it { is_expected.to validate_presence_of :lng }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :pintags }
  end

  describe 'class method' do
    let!(:pin) { create(:pin) }
    let!(:tag) { create(:tag) }
    let!(:pintag) { create(:pintag, pin_id: pin.id, tag_id: tag.id) }

    it "changes the tag object's label to a string" do
      expect(Pin.tags_to_s(pin)).to eq(tag.label)
    end
  end
end
