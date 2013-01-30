class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
