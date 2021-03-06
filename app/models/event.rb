class Event < ActiveRecord::Base
  #relationship wuth activities
  has_many :activities, :dependent => :destroy
  #relationship with expenses
  has_many :expenses
  attr_accessible :title, :description, :category_id, :start_date, :end_date, :category_id, :start_time, :end_time
   
  validates :title, :description, :category_id, :start_date, :end_date, :presence => true
  validates_length_of :title, :within => 6..30, :too_long => "Pick a shorter Title", :too_short => "Pick a longer Title"
  belongs_to :category
end
