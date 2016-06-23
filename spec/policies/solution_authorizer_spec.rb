# frozen_string_literal: true
require 'rails_helper'

describe SolutionAuthorizer do
  subject(:solution_policy) { described_class.new(user, solution) }

  describe '#authorized?' do
    context 'with solution' do
      subject { solution_policy.authorized? }

      let(:user) { create(:user) }
      let(:started_challenge) { create(:started_challenge, user: user) }
      let(:solution) { create(:solution, started_challenge: started_challenge) }

      it { is_expected.to be_truthy }
    end
  end
end
