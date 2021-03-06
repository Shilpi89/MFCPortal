class Activity < ActiveRecord::Base
  attr_accessible :title, :description, :created_by, :event_id
  #relationship with events
  belongs_to :event

  validates :description,:title, :presence => true
  validates_length_of :title, :within => 6..30, :too_long => "Pick a shorter Title", :too_short => "Pick a longer Title"

  # def self.create_new_activities(new_activity_title, new_activity_description, current_user)

  #   if !new_activity_title.nil?
  #     @activity = Activity.new(:title => new_activity_title, :description => new_activity_description, :created_by => current_user.id)
  #     @activity.save
  #     if activities.blank?
  #       activities = []
  #       activities << @activity.id
  #     else
  #       activities << @activity.id
  #     end
  #   else
  #     activities
  #   end
  # end


end
