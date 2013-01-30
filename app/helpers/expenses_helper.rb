module ExpensesHelper

  def total_expense_amt id
    amt = Expense.new.expense_amount(id)
    amt
  end
end
