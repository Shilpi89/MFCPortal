class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :description, :null => false
      t.float :amount, :null => false
	    t.integer :created_by, :null => false
      t.integer :updated_by, :null => false
      t.references :event
      t.timestamps
    end
    add_index :expenses, :event_id, :name => 'idx_expenses_event_id'
  end
end
