class Event < ActiveRecord::Base
  #relationship wuth activities
  has_many :events_activities
  has_many :activities, :through => :events_activities
  
  #relationship with expenses
  has_many :expenses
  attr_accessible :title, :description, :start_date, :end_date, :category_id
   
  validates :title, :description, :category_id, :start_date, :end_date, :presence => true
  validates :title, :length => 
  {
   :maximum => 50,
   :too_long  => "Can have at most %{count} words"
  }

  validates :description, :length =>
   { 
    :maximum => 500,
    :too_long  => "Can have at most %{count} words"
    }
  belongs_to :category

end
