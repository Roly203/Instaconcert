class AddingEventgroupIdToEvents < ActiveRecord::Migration
  def change
		add_column :events, :eventgroup_id, :integer
  end
end
