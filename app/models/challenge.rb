class Challenge < ActiveRecord::Base
  has_many :started_challenges
  has_many :users, through: :started_challenges

  def started_by?(user)
    started_challenges.find_by(user: user)
  end
end
