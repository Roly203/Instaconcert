class CreateEventRequests < ActiveRecord::Migration
  def change
    create_table :event_requests do |t|
      t.float :lat
      t.float :long
      t.integer :min_timestamp
      t.integer :max_timestamp
      t.integer :distance

      t.timestamps
    end
  end
end
