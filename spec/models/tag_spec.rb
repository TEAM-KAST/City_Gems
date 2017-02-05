require 'rails_helper'

RSpec.describe Tag, type: :model do
  let!(:tag) { create(:tag) }
  describe 'tag associations' do
    it { is_expected.to have_many(:pin_tags)}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:label) }

    it "generates a label" do
      expect(tag.label).to be_in Tag::TAGS
    end

    it "does not generate an incorrect label" do
      tag.label = "super dope"
      expect(tag.label).to_not be_in Tag::TAGS
    end

    it "is valid when it's Quirky" do
      tag.valid?
      expect(tag.errors[:label]).to be_empty
    end

    it "is NOT valid when it's pineapple" do
      tag.label = "super dope"
      tag.valid?
      expect(tag.errors[:label]).to_not be_empty
    end
  end
end
