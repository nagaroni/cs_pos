class AddPointsToStartedChallenge < ActiveRecord::Migration
  def change
    add_column :started_challenges, :points, :integer
  end
end
