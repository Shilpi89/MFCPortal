class EventsController < ApplicationController
  
  #load_and_authorize_resource
  skip_filter :authenticate_user!, :only => :dashboard

  def welcome
  end
    
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @activities = Activity.all
    #@categories = Category.all
  end

  def dashboard
    @events = Event.all
    @activities = Activity.all
    @categories = Category.all
  end

    
  def create
    @activities = Activity.all
    @categories = Category.all
    @event = Event.new (params[:event])
    #code for setting dynamic category


#          if params[:event][:category_id].blank?
#              unless params[:new_category_name].nil?
#                @category = Category.new(:name => params[:new_category_name], :description => params[:new_category_description], :created_by => current_user.id, :updated_by => current_user.id)
#                @category.save
#                @event = Event.new (params[:event])
#                @event.category_id = @category.id
#               @event.created_by = current_user.id
#               @event.updated_by = current_user.id
#               @event.save
#             else
#                @event = Event.new (params[:event])
#               @event.created_by = current_user.id
#               @event.updated_by = current_user.id
#                @event.save
#             end
#           else
#             @event = Event.new (params[:event])
#             @event.created_by = current_user.id
#             @event.updated_by = current_user.id
#              @event.save
#            end

    activities = Activity.create_new_activities(params[:activities], params[:new_activity_title], params[:new_activity_description], current_user )
    EventsActivity.add_event_activities(@event, activities)

    category = Category.create_new_category(params[:event][:category_id], params[:new_category_name], params[:new_category_description], current_user)
    
    
    @event.category_id = category
    @event.created_by = current_user.id
    @event.updated_by = current_user.id
      
    if @event.save
      flash[:notice] = "Successfully created a new Event."
      redirect_to events_path
    else
      flash[:notice] = @event.errors.full_messages.join(", ")
      render :action => :new
    end

  end


  def show
    @event = Event.find(params[:id])
    @eventsActivities = EventsActivity.where("event_id = #{@event.id}")
    @expenses = Expense.where("event_id = #{@event.id}")
  end


  def destroy
    @event = Event.find(params[:id])
    EventsActivity.destroy_all("event_id = #{@event.id}")
    Expense.destroy_all("event_id = #{@event.id}")
        
    @event.destroy
    if @event.destroy
      flash[:notice] = "Successfully deleted Event."
      redirect_to events_url
    else
      flash[:notice] = "Event Could Not Be deleted."
      redirect_to events_url
    end
        
  end

    
  def edit
    @event = Event.find(params[:id])
    @activities = Activity.all
    @categories = Category.all
  end


  def update
    @event = Event.find(params[:id])
#    unless params[:new_category_name].nil?
#      @category = Category.new(:name => params[:new_category_name], :description => params[:new_category_description], :created_by => current_user.id, :updated_by => current_user.id)
#      @category.save
#      params[:event][:category_id] = @category.id
#      @event.update_attributes(params[:event])
#      p params[:event]
#    else
#
#      @event.update_attributes(params[:event])
#
#    end

    activities = Activity.create_new_activities(params[:activities], params[:new_activity_title], params[:new_activity_description], current_user)
    EventsActivity.update_event_activities(@event, activities)

    category = Category.create_new_category(params[:event][:category_id], params[:new_category_name], params[:new_category_description], current_user)
    params[:event][:category_id] = category

    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully Updated Event."
      redirect_to event_path(params[:id])
    else
      flash[:notice] = @event.errors.full_messages.join(", ")
      render :action => :edit
    end
  end

  def other_activity
    respond_to do |format|
      format.js {}
    end
  end

  def other_category
    respond_to do |format|
      format.js {}
    end

  end
end