class EventsActivity < ActiveRecord::Base
  attr_accessible :event_id, :activity_id
  belongs_to :event
  belongs_to :activity

  

	def self.add_remove_activities(activities,event)
	
		existing_event_ids = event.activities.collect{|e| e.id.to_s}
		events_ids_to_remove = existing_event_ids - activities
		events_ids_to_add = activities - existing_event_ids

		events_ids_to_add.each do |add|
			EventsActivity.create(:event_id => event.id,:activity_id => add.to_i)  
		end

		events_ids_to_remove.each do |remove|
			EventsActivity.destroy_all(:event_id => event.id ,:activity_id => remove.to_i)		
		end
	end
	
end