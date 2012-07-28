class ChangingCaptiontextType < ActiveRecord::Migration
  def up
    change_column :images, :caption_text, :text
  end

  def down
  end
end
