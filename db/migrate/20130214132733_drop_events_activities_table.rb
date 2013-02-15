class DropEventsActivitiesTable < ActiveRecord::Migration
  def up
  	drop_table :events_activities
  end

  def down
  	create_table :events_activities do |t|
      t.references :event
      t.references :activity
      t.timestamps
    end
    add_index :events_activities, :event_id, :name => 'idx_events_acts_event_id'
    add_index :events_activities, :activity_id, :name => 'idx_events_acts_activity_id'
  end
end