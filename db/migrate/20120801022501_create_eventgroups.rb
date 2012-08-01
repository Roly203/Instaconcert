class CreateEventgroups < ActiveRecord::Migration
  def change
    create_table :eventgroups do |t|
			t.string :name
      t.timestamps
    end
  end
end
