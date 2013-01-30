class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.text :description
      t.float :amount
	    t.integer :created_by
      t.integer :updated_by
      t.references :event
      t.timestamps
    end
    add_index :expenses, :event_id, :name => 'idx_expenses_event_id'
  end
end
