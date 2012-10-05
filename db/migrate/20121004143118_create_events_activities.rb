class CreateEventsActivities < ActiveRecord::Migration
  def change
    create_table :events_activities do |t|
      t.references :event
      t.references :activity
      t.string :description
      t.timestamps
    end
    add_index :events_activities, :event_id, :name => 'idx_events_acts_event_id'
    add_index :events_activities, :activity_id, :name => 'idx_events_acts_activity_id'
  end
end
