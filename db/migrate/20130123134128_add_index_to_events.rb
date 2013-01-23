class AddIndexToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
    t.references :category
    end
    add_index :events, :category_id
  end
end
