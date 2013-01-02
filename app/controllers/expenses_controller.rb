class ExpensesController < ApplicationController
load_and_authorize_resource

	before_filter :load_event

	def load_event
		@event = Event.find(params[:event_id])
	end

	def index	
		@expenses = Expense.where("event_id = #{params[:event_id]}")	
	end	   

	def new		
		@expense = Expense.new
	end

	def create		
		@expense = Expense.new (params[:expense])
		@expense.event_id = params[:event_id]
		@expense.created_by = current_user.id
		@expense.updated_by = current_user.id		
		if @expense.save
        	flash[:notice] = "Successfully added a new Expense."
        	redirect_to event_expenses_url
         else
        	flash[:notice] = @expense.errors.full_messages.join(", ")
        	render :action => :new
      	end
	end

	def edit
		@expense = Expense.find(params[:id]) 
	end

    def destroy
    	@expense = Expense.find(params[:id])
    	@expense.destroy
        if @expense.destroy
            flash[:notice] = "Successfully deleted Expense."
            redirect_to event_expenses_url
         else
            flash[:notice] = "Expense Could Not Be deleted."
            redirect_to event_expenses_url
        end
	end

	def update
        @expense = Expense.find(params[:id]) 
        @expense.update_attributes(params[:expense]) 
        if @expense.update_attributes(params[:expense])
            flash[:notice] = "Successfully Updated Expense."
            redirect_to event_expenses_url
         else
            flash[:notice] = @expense.errors.full_messages.join(", ")
            render :action => :edit
        end
	end

end