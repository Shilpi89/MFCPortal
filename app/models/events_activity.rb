class EventsActivity < ActiveRecord::Base
  attr_accessible :event_id, :activity_id
  belongs_to :event
  belongs_to :activity

end