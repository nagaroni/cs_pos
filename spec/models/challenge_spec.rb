require 'rails_helper'

describe Challenge do
  describe '#started_by?' do
    it 'started by same user' do
      user = create(:user)
      challenge = create(:challenge, users: [user])
      expect(challenge.started_by?(user)).to be_truthy
    end

    it 'not started' do
      user = create(:user)
      challenge = create(:challenge)
      expect(challenge.started_by?(user)).to be_falsy
    end

    it 'started by another user' do
      another_user = create(:user, email: 'another@test.com')
      user = create(:user)
      challenge = create(:challenge, users: [user])
      expect(challenge.started_by?(another_user)).to be_falsy
    end
  end
end
