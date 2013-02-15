class AddEventReferenceToActivities < ActiveRecord::Migration
  def change
    change_table :activities do |t|
    t.references :event
    end
     add_index :activities, :event_id, :name => 'idx_activities_event_id'
  end
end
