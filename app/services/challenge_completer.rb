# frozen_string_literal: true
class ChallengeCompleter
  def initialize(finished_at = Time.zone.now)
    @finished_at = finished_at
  end

  def complete(challenge, user)
    return false unless verify(challenge, user)
    started_challenge.update(finished_at: finished_at, points: challenge.points)
    started_challenge.create_solution
    started_challenge
  end

  private

  def verify(challenge, user)
    if challenge.started_by?(user)
      @started_challenge = challenge.started_challenge_for(user)
      not_completed?
    else
      false
    end
  end

  def not_completed?
    !started_challenge.completed?
  end

  attr_reader :finished_at, :started_challenge
end
