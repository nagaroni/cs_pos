class ChallengeTerminator
  def initialize(finished_at = Time.zone.now)
    @finished_at = finished_at
  end

  def terminate(challenge, user)
    started_challenge = challenge.started_by?(user)
    started_challenge.update(finished_at: finished_at, points: challenge.points)
    started_challenge.create_solution
  end

  private

  attr_reader :finished_at
end
