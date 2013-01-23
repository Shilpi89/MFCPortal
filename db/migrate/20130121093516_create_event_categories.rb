class CreateEventCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :created_by, :null => false
      t.integer :updated_by, :null => false
      t.timestamps
    end
  end
end
