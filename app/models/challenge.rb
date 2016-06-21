# frozen_string_literal: true
class Challenge < ActiveRecord::Base
  has_many :started_challenges
  has_many :users, through: :started_challenges
  has_many :comments, as: :commentable

  def started_by?(user)
    !started_challenge_for(user).nil?
  end

  def started_challenge_for(user)
    started_challenges.find_by(user: user)
  end
end
