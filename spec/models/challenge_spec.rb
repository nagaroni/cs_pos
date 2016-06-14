require 'rails_helper'

describe Challenge do
  describe '#started_by?' do
    it 'find user' do
      user = create(:user)
      challenge = create(:challenge, users: [user])
      expect(challenge.started_by?(user)).to be_truthy
    end

    it 'without user' do
      user = create(:user)
      challenge = create(:challenge)
      expect(challenge.started_by?(user)).to be_falsy
    end
  end
end
