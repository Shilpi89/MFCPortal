class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
        @activities = Activity.all
    end

    def create
        @event = Event.new (params[:event])
        @event.created_by = current_user.id
        @event.updated_by = current_user.id
        if @event.save
            flash[:notice] = "Successfully created a new Event."
            redirect_to events_path
         else               
            flash[:notice] = @event.errors.full_messages.join(", ")
            render :action => :new
        end

        params[:activities].each do |activity|
        @eventsActivity = EventsActivity.new(:event_id => @event.id,
         :activity_id => activity)
        @eventsActivity.save
        end
    end


    def show
        @event = Event.find(params[:id])
    end


    def destroy
        @event = Event.find(params[:id])
        @eventsActivities = EventsActivity.where("event_id = #{@event.id}")
        @expenses = Expense.where("event_id = #{@event.id}")
        
        @eventsActivities.each do |ea|
            ea.destroy
        end

        @expenses.each do |ex|
            ex.destroy
        end

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
        if @event.update_attributes(params[:event])
            flash[:notice] = "Successfully Updated Event."
            redirect_to event_path(params[:id])
         else
            flash[:notice] = "Event Could Not Be Updated."
            render :action => :edit
        end
    end       
end