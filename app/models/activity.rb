class Activity < ActiveRecord::Base
  # attr_accessible :title, :body
  #relationship with events
  has_many :events_activities
  has_many :events, :through => :events_activities
end
