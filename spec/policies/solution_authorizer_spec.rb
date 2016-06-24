# frozen_string_literal: true
require 'rails_helper'

describe SolutionAuthorizer do
  subject(:solution_policy) { described_class.new(user, solution) }

  describe '#authorized?' do
    subject { solution_policy.authorized? }

    context 'when he is the owner' do
      let(:user) { create(:user) }
      let(:started_challenge) { create(:started_challenge, user: user) }
      let(:solution) { create(:solution, started_challenge: started_challenge) }

      it { is_expected.to be_truthy }
    end

    context 'when he is not the owner' do
      let(:user) { create(:user, email: 'pepino@boat.com') }
      let(:solution) { create(:solution) }

      it { is_expected.to be_falsy }
    end
  end
end
