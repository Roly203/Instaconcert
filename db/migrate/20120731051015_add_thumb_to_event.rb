class AddThumbToEvent < ActiveRecord::Migration
  def change
    add_column :events, :thumb_img_id, :integer
  end
end
