class ChangeImageTimesToDatetime < ActiveRecord::Migration
  def change
    change_column :images, :caption_time, :DateTime
    change_column :images, :img_time, :DateTime
  end
  
end
