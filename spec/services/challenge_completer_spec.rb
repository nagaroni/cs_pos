# frozen_string_literal: true
require 'rails_helper'

describe ChallengeCompleter do
  subject { described_class.new(finished_at) }
  let(:finished_at) { Time.zone.now }

  describe '#terminate' do
    it 'with started challenge' do
      started_challenge = double(:started_challenge)
      user              = build_stubbed(:user)
      solution          = double(:solution)
      challenge         = build_stubbed(:challenge)
      allow(challenge)
        .to receive(:started_challenge_for).and_return(started_challenge)
      allow(challenge).to receive(:started_by?).and_return(true)
      allow(started_challenge).to receive(:completed?).and_return(false)

      expect(started_challenge)
        .to receive(:create_solution).and_return(solution)
      expect(started_challenge).to receive(:update)
        .with(finished_at: finished_at, points: challenge.points)
      expect(subject.complete(challenge, user)).to eq started_challenge
    end

    it 'without started challenge' do
      user      =  double(:user)
      challenge =  double(:challenge)
      allow(challenge).to receive(:started_by?).with(user).and_return(false)
      expect(subject.complete(challenge, user)).to eq false
    end

    it 'already completed' do
      user              = double(:user)
      challenge         = double(:challenge)
      started_challenge = double(:started_challenge)
      allow(challenge).to receive(:started_by?).with(user).and_return(true)
      allow(challenge).to receive(:started_challenge_for)
        .with(user).and_return(started_challenge)
      allow(started_challenge).to receive(:completed?).and_return(true)
      expect(subject.complete(challenge, user)).to eq false
    end
  end
end
