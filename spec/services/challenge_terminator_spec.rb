require 'rails_helper'

describe ChallengeTerminator do
  subject { described_class.new(finished_at) }
  let(:finished_at) { Time.zone.now }

  describe '#terminate' do
    it do
      started_challenge = double(:started_challenge)
      user              = double(:user)
      solution          = double(:solution)
      challenge         = build_stubbed(:challenge)
      allow(challenge).to receive(:started_by?).and_return(started_challenge)
      expect(started_challenge)
        .to receive(:create_solution).and_return(solution)
      expect(started_challenge)
        .to receive(:update).with(finished_at: finished_at, points: challenge.points)
      expect(challenge).to receive(:started_by?)
      expect(subject.terminate(challenge, user)).to eq solution
    end
  end
end
