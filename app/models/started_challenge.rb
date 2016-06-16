class StartedChallenge < ActiveRecord::Base
  belongs_to :challenge
  belongs_to :user
  has_one :solution
end
