# frozen_string_literal: true
class PointsCalculator
  def initialize(user)
    @user = user
  end

  def calculate
    comments_points + challenge_points
  end

  private

  attr_reader :user, :comments_query

  def comments_points
    user.solution_comments.count * Comment::POINTS
  end

  def challenge_points
    user.started_challenges.inject(0) { |a, e| a + e.points }
  end
end
