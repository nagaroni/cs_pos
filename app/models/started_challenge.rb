class StartedChallenge < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user
  has_one :solution

  def finalize!
    update(finished_at: Time.zone.now)
    Solution.create(started_challenge: self)
  end
end
