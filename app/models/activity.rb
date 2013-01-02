class Activity < ActiveRecord::Base
  attr_accessible :title, :description, :created_by
  #relationship with events
  has_many :events_activities
  has_many :events, :through => :events_activities


  validates :description, :title, :presence => true
  validates :description, :length => 
  { :maximum => 500,
    :too_long  => "Can have at most %{count} words"
  }

end
