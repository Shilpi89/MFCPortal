class Expense < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :event
  attr_accessible :description, :amount

  validates :description, :amount, :presence => true
  validates :amount, :numericality => { :only_integer => true }


  def expense_amount(id)
    @expenses = Expense.where(:event_id => id)
    @each_amount = 0
    @expenses.each do |expense|
      @each_amount = @each_amount + expense.amount
    end
    @each_amount
  end
end
