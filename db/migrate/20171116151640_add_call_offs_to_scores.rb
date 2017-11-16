class AddCallOffsToScores < ActiveRecord::Migration[5.1]
  def change
    add_column :scores, :recentRequestShifts, :integer
    add_column :scores, :nonRecentRequestShifts, :integer
    add_column :scores, :recentCallOffs, :integer
    add_column :scores, :nonRecentCallOffs, :integer
    add_column :scores, :recentNoShow, :integer
    add_column :scores, :nonRecentNoShow, :integer
    rename_column :scores, :SHITS, :V1SHITS
    add_column :scores, :V2SHITS, :float
  end
end
