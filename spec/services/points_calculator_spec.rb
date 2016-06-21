# frozen_string_literal: true
require 'rails_helper'

describe PointsCalculator do
  describe '#calculate' do
    it 'with comments and completed challenge' do
      user = create(:user)
      create(:started_challenge, user: user, points: 10)
      allow(user).to receive(:solution_comments).and_return([double, double])
      calculator = described_class.new(user)
      expect(calculator.calculate).to eq 20
    end

    it 'with comments' do
      user = create(:user)
      create_list(:comment, 3, user: user, commentable: create(:solution))
      calculator = described_class.new(user)
      expect(calculator.calculate).to eq 15
    end

    it 'with completed challenge' do
      user = create(:user)
      create(:started_challenge, user: user, points: 10)
      calculator = described_class.new(user)
      expect(calculator.calculate).to eq 10
    end
  end
end
