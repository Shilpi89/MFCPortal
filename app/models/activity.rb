class Activity < ActiveRecord::Base
  attr_accessible :title, :description, :created_by
  #relationship with events
  has_many :events_activities
  has_many :events, :through => :events_activities


  validates :description,:title, :presence => true
  validates_length_of :title, :within => 6..30, :too_long => "Pick a shorter Title", :too_short => "Pick a longer Title"

end
