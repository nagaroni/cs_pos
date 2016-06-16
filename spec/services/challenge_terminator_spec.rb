require 'rails_helper'

describe ChallengeTerminator do
  subject { described_class.new(model_solution, finished_at) }
  let(:model_solution) { double(:model_solution) }
  let(:finished_at) { Time.zone.now }

  describe '#terminate' do
    it do
      started_challenge = double(:started_challenge)
      user              = double(:user)
      solution          = double(:solution)
      challenge         = spy(:challenge)
      allow(challenge).to receive(:started_by?).and_return(started_challenge)
      allow(model_solution)
        .to receive(:create)
        .with(started_challenge: started_challenge).and_return(solution)
      expect(started_challenge)
        .to receive(:update).with(finished_at: finished_at)
      expect(subject.terminate(challenge, user)).to eq solution
      expect(challenge).to have_received(:started_by?)
    end
  end
end
