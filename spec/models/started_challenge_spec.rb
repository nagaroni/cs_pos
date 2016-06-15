require 'rails_helper'

describe StartedChallenge do
  describe '#finalize!' do
    it '' do
      started_challenge = create(:started_challenge)
      solution = started_challenge.finalize!
      expect(solution).to be_truthy
    end
  end
end
