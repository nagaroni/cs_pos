class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.integer :points

      t.timestamps null: false
    end
  end
end
