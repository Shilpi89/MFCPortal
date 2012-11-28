class Event < ActiveRecord::Base
  #relationship wuth activities
  has_many :events_activities
  has_many :activities, :through => :events_activities
  
  #relationship with expenses
  has_many :expenses
  attr_accessible :title, :description, :category, :start_date, :end_date
   
  validates :title, :description, :category, :start_date, :end_date, :presence => true
  validates :title, :length => 
  { :minimum => 8,
    :maximum => 50,
    :too_short => "must have at least %{count} words",
    :too_long  => "can have at most %{count} words"
  }

  validates :description, :length => { :maximum => 500 }


end
