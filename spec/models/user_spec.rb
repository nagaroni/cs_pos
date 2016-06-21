# frozen_string_literal: true
require 'rails_helper'

describe User do
  describe '#points' do
    it 'with a completed challenge' do
      user = create(:user)
      create(:started_challenge, user: user, points: 10)
      expect(user.points).to eq 10
    end

    it 'with a completed challenge and a solution comment' do
      user = create(:user, email: 'email@email.com')
      started_challenge = create(:started_challenge, user: user, points: 10)
      challenge = started_challenge.challenge
      solution = challenge.started_challenges
                          .create(user: create(:user), points: 0)
                          .create_solution
      solution.comments.create(user: user)
      expect(user.points).to eq 15
    end

    it 'with a completed challenge and a comment in his own solution' do
      user = create(:user, email: 'email@email.com')
      started_challenge = create(:started_challenge, user: user, points: 10)
      solution = started_challenge.create_solution
      solution.comments.create(user: user)
      expect(user.points).to eq 10
    end
  end
end
