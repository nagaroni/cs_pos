# frozen_string_literal: true
class SolutionAuthorizer
  def initialize(user, solution)
    @user     = user
    @solution = solution
  end

  def authorized?
    started_challenge.solution if !!started_challenge
  end

  private

  def started_challenge
    user
      .started_challenges
      .find_by(challenge: solution.started_challenge.challenge)
  end

  attr_reader :user, :solution
end
