# frozen_string_literal: true
require 'rails_helper'

describe StartedChallenge do
  describe '#complete' do
    it 'not completed' do
      started = StartedChallenge.new
      expect(started).to_not be_completed
    end

    it 'completed' do
      started = StartedChallenge.new(finished_at: Time.zone.now)
      expect(started).to be_completed
    end
  end
end
