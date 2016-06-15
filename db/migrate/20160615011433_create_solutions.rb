class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.belongs_to :started_challenge, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
