class AddStuffToEvents1 < ActiveRecord::Migration
  def change
    add_column :events, :min_timestamp, :integer
    add_column :events, :max_timestamp, :integer
    add_column :events, :distance, :integer
    add_column :events, :lat, :float
    add_column :events, :long, :float
    add_column :events, :venue_name, :string
    add_column :events, :start_time, :date
    
  end
end
