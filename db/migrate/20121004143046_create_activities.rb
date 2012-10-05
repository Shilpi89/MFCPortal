class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title, :null => false
      t.string :description
      t.integer :created_by, :null => false
      t.integer :updated_by, :null => false
      t.timestamps
    end
  end
end
