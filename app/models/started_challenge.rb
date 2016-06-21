# frozen_string_literal: true
class StartedChallenge < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user
  has_one :solution

  def completed?
    finished_at.present?
  end
end
