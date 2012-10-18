class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  #relationship wuth activities
  has_many :events_activities
  has_many :events, :through => :events_activities
  #relationship with expenses
  has_many :expenses		
end
