class EventsActivity < ActiveRecord::Base
  attr_accessible :event_id, :activity_id
  belongs_to :event
  belongs_to :activity

  

  def self.add_event_activities (event, activities)
    activities.each do |activity|
      @eventsActivity = EventsActivity.new(:event_id => event.id,
        :activity_id => activity)
      @eventsActivity.save
    end
  end

  def self.update_event_activities(event, activities)

    existing_activities_ids = event.activities.collect{|e| e.id.to_s}
    activities_ids_to_remove = existing_activities_ids - activities
    activities_ids_to_add = activities - existing_activities_ids

    activities_ids_to_add.each do |add|
      EventsActivity.create(:event_id => event.id,:activity_id => add.to_i)
    end

    activities_ids_to_remove.each do |remove|
      EventsActivity.destroy_all(:event_id => event.id ,:activity_id => remove.to_i)
    end
  end
end