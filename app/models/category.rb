class Category < ActiveRecord::Base
  attr_accessible :description, :name, :created_by, :updated_by, :presence => true
  validates :description, :length => 
  { :maximum => 500,
    :too_long  => "Can have at most %{count} words"
  }
  has_many :events
end
