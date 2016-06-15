class AddFinishedAtToStartedChallenge < ActiveRecord::Migration
  def change
    add_column :started_challenges, :finished_at, :datetime
  end
end
