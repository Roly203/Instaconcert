class AddingEventid < ActiveRecord::Migration
  def change
    add_column :images, :event_id, :integer
  end

end
