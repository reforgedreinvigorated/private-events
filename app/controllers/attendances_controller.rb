class AttendancesController < ApplicationController
    before_action :is_logged_in?

    def create
        event = Event.find(params[:event_id])
        @attendance = current_user.attendances.build(attended_event_id: event.id)
        if @attendance.save
            flash[:notice] = "You are attending #{event.name}"
            redirect_to current_user
        else
            flash[:alert] = "You are already attending #{event.name}"
            redirect_to event_path(params[:event_id])
        end
    end

    
    private

    def is_logged_in?
        unless user_signed_in?
            redirect_to new_user_session_path
        end
    end
end
