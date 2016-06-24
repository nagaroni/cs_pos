# frozen_string_literal: true
class SolutionAuthorizer
  def initialize(user, solution)
    @user     = user
    @solution = solution
  end

  def authorized?
    owner? || solution?
  end

  private

  def solution?
    user
      .started_challenges
      .find_by(challenge: solution.started_challenge.challenge)
      .try(:solution)
  end

  def owner?
    solution.user == user
  end

  attr_reader :user, :solution
end
