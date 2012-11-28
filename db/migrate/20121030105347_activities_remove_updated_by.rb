class ActivitiesRemoveUpdatedBy < ActiveRecord::Migration
  
  def up
  	remove_column :activities, :updated_by
  end

  def down
  	add_column :activities, :updated_by, :null => false
  end
end
