class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :instagram_id
      t.float :lat
      t.float :long
      t.string :img_lowres_url
      t.string :img_thumb_url
      t.string :img_standard_url
      t.string :caption_text
      t.time :caption_time
      t.integer :like_count
      t.time :img_time
      t.string :instagram_link_url

      t.timestamps
    end
  end
end
