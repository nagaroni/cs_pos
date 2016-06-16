class ChallengeTerminator
  def initialize(model_solution = Solution, finished_at = Time.zone.now)
    @model_solution = model_solution
    @finished_at = finished_at
  end

  def terminate(challenge, user)
    started_challenge = challenge.started_by?(user)
    started_challenge.update(finished_at: finished_at)
    model_solution.create(started_challenge: started_challenge)
  end

  private

  attr_reader :model_solution, :finished_at
end
