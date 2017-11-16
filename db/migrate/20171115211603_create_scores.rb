class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.integer :hourOffset
      t.integer :shiftCount
      t.integer :recentShifts
      t.integer :nonRecentShifts
      t.float :SHITS
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
