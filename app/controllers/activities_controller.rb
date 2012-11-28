class ActivitiesController < ApplicationController
	before_filter :load_event
	def load_event
		@event = Event.find(params[:event_id])
	end


	def new 

	end

	def create
	end

end
