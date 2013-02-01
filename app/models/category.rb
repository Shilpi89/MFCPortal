class Category < ActiveRecord::Base
  attr_accessible :description, :name, :created_by, :updated_by

  validates :name, :description, :presence => true
  validates_length_of :name, :within => 6..30, :too_long => "Pick a shorter Name", :too_short => "Pick a longer name"
  has_many :events

  def self.create_new_category(category, new_category_name, new_category_description, current_user)

    if category.blank?
       if !new_category_name.nil?
           @category = Category.new(:name => new_category_name, :description => new_category_description, :created_by => current_user.id, :updated_by => current_user.id)
           @category.save
           category = @category.id
       else
         category
        end
    else
      category
     end
  end

#  def self.update_new_category(category, new_category_name, new_category_description, current_user)
#
#  end


end
