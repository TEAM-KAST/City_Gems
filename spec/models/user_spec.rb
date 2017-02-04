require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user oauth method' do
    it "creates or updates itself from an oauth hash" do
      auth = { provider: "google",uid: "12345678910",
      info: { email: "jesse@mountainmantechnologies.com",first_name: "Jesse",last_name: "Spevack" },
      credentials: { token: "abcdefg12345", refresh_token: "12345abcdefg", expires_at: DateTime.now } }

      User.update_or_create(auth)
      new_user = User.first

      expect(new_user.uid).to eq("12345678910")
      expect(new_user.first_name).to eq("Jesse")
      expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])
    end

    describe 'associations' do
      xit { should have_many(:pins)}
      xit { should have_many(:comments)}
      # it { should have_many(:votes)} if we have votes
    end

  end
end
