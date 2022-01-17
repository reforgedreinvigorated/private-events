class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update
            redirect_to event_path
        else
            flash[:alert] = "failed to update #{@event.name}"
            render :edit
        end
    end

    def destroy
        @event = Event.find(params[:id])
        if @event.destroy
            flash[:notice] = "#{@event.name} has been deleted"
            redirect_to root_path
        else
            flash[:alert] = "Failed to delete event: #{@event.name}"
            render :show
        end
    end

    private
    def event_params
        params.require(:event).permit(:name, :location, :date)
    end

end
