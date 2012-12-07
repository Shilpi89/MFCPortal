class RemoveDescriptionColumnEventsActivities < ActiveRecord::Migration
  def up
  	remove_column :events_activities, :description
  end

  def down
  	add_column :events_activities, :description
  end
end
