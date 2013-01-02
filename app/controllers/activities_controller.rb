class ActivitiesController < ApplicationController

    load_and_authorize_resource

    def index
        @activities = Activity.all
    end

    def new
        @activity = Activity.new
    end

    def create
       
        @activity = Activity.new (params[:activity])
        @activity.created_by = current_user.id
     
        if @activity.save
            flash[:notice] = "Successfully created a new activity."
            redirect_to activities_path
         else               
            flash[:notice] = @activity.errors.full_messages.join(", ")
            render :action => :new
        end
    end

    def destroy
        @activity = Activity.find(params[:id])    
        @activity.destroy
        if @activity.destroy
            flash[:notice] = "Successfully deleted activity."
            redirect_to activities_url
         else
            flash[:notice] = "activity Could Not Be deleted."
            redirect_to activities_url
        end
        
    end

    
    def edit
        @activity = Activity.find(params[:id]) 
     
    end


    def update
        @activity = Activity.find(params[:id]) 
        @activity.update_attributes(params[:activity]) 
        if @activity.update_attributes(params[:activity])
            flash[:notice] = "Successfully Updated activity."
            redirect_to activities_path
         else
            flash[:notice] = "activity Could Not Be Updated."
            render :action => :edit
        end
    end    

  



end
