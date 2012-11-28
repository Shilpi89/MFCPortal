class Expense < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :event
  attr_accessible :description, :amount

  validates :description, :amount, :presence => true
  validates :description, :length => 
  { :minimum => 20,
    :maximum => 500,
    :too_short => "must have at least %{count} words",
    :too_long  => "can have at most %{count} words"
  }
 validates :amount, :numericality => {:only_integer => true}
 {

 }
end
