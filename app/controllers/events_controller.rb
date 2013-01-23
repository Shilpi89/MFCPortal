class EventsController < ApplicationController
  
load_and_authorize_resource

    def welcome
    end
    
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
        @activities = Activity.all
    end

    def create
        @activities = Activity.all
        if params[:category_id].blank?
          unless params[:new_category_name].nil?
            @category = Category.new(:name => params[:new_category_name], :description => params[:new_category_description], :created_by => current_user.id, :updated_by => current_user.id)
            @category.save
            @event = Event.new (params[:event])
            @event.category_id = @category.id
            @event.created_by = current_user.id
            @event.updated_by = current_user.id
            @event.save
          end
        else
          @event = Event.new (params[:event])
          @event.created_by = current_user.id
          @event.updated_by = current_user.id
          @event.save
        end

        if params[:activities].blank?
            if params[:new_activity_title].nil? 
            else
                @activity = Activity.new(:title => params[:new_activity_title], :description => params[:new_activity_description], :created_by => current_user.id)
                @activity.save
                @eventsActivity = EventsActivity.new(:event_id => @event.id,
                :activity_id => @activity.id)
                @eventsActivity.save
            end  

        else
         
             if params[:new_activity_title].nil? 
            else
                @activity = Activity.new(:title => params[:new_activity_title], :description => params[:new_activity_description], :created_by => current_user.id)
                @activity.save
                params[:activities] << @activity.id
            end

            params[:activities].each do |activity|
                @eventsActivity = EventsActivity.new(:event_id => @event.id,
                :activity_id => activity)
                @eventsActivity.save
            end
        end


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
    end


    def update
        @event = Event.find(params[:id]) 
        @event.update_attributes(params[:event]) 

        if params[:new_activity_title].nil? 
        else
            @activity = Activity.new(:title => params[:new_activity_title], :description => params[:new_activity_description], :created_by => current_user.id)
            @activity.save!
            params[:activities] << @activity.title
        end

        EventsActivity.add_remove_activities(params[:activities],@event)

        if @event.update_attributes(params[:event])
            flash[:notice] = "Successfully Updated Event."
            redirect_to event_path(params[:id])
         else
            flash[:notice] = "Event Could Not Be Updated."
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