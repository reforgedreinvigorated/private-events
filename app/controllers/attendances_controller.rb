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

    def destroy
        user_id = params[:attendee_id]
        event = Event.find(params[:attended_event_id])

        @attendance = Attendance.find_by(attendee_id: user_id, attended_event_id: event.id)
        if @attendance.destroy
            flash[:notice] = "You are no longer attending #{event.name}"
            redirect_to event_path(event.id)
        else
            flash[:alert] = "Failed to stop attending #{event.name}"
            render root_path
        end

    end
    
    private

    def is_logged_in?
        unless user_signed_in?
            redirect_to new_user_session_path
        end
    end
end
