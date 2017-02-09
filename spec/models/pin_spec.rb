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
    let!(:pin) { create(:pin)}
    let!(:pintag) { create(:pintag)}
    let!(:tag) { create(:tag)}
    it "changes the tag object's to a string" do
      p Pin.tags_to_s(pin)
      expect(Pin.tags_to_s(pin)).to eq "Quirky"
    end
  end
end
