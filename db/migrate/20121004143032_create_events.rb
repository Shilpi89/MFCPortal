class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, :null => false
      t.string :description		
      t.datetime :start_date, :null => false
      t.datetime :end_date, :null => false
      t.integer :category, :null => false
      t.integer :created_by, :null => false
      t.integer :updated_by, :null => false      
      t.timestamps
    end
  end
end
