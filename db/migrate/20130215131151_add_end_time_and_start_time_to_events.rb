class AddEndTimeAndStartTimeToEvents < ActiveRecord::Migration
   def up
  		add_column :events, :start_time, :time
  		add_column :events, :end_time, :time
  	end

  	def down
  		remove_column :events, :start_time, :time
  		remove_column :events, :end_time, :time
  	end
end
