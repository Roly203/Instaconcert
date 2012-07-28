class ChangeToDatetime < ActiveRecord::Migration
  def change
    change_column :events, :start_time, :datetime
  end
end
