class Category < ActiveRecord::Base
  attr_accessible :description, :name, :created_by, :updated_by

  validates :name, :description, :presence => true
  validates_length_of :name, :within => 6..30, :too_long => "Pick a shorter Name", :too_short => "Pick a longer name"
  has_many :events
end
