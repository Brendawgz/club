class EventsController < ApplicationController
    before_action :set_event, only: [:edit, :update, :show, :destroy]
    before_action :require_admin, except: [:index, :show]
    
    def index
        @events = Event.all
    end
    
    def past
        @events = Event.all
    end
        
    def new
        @event = Event.new
    end
    
    def create
        @event = Event.create(event_params)
        if @event.save
            flash[:success] = "You've successfully created an event"
            redirect_to events_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @event.update(event_params)
            flash[:success] = "Event updated"
            redirect_to events_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        if @event.past?
            @event.destroy
            redirect_to past_events_path
        else
            @event.destroy
            redirect_to events_path
        end
        flash[:danger] = "Event has been successfully cancelled"
    end
    
    private
    def event_params
      params.require(:event).permit(:name, :date, :capacity, :theme, :past)
    end
    
    def set_event
       @event = Event.find(params[:id]) 
    end
    
    def require_admin
       if !logged_in? || (logged_in? and !current_user.admin?)
           flash[:danger] = "Only admins can perform that action"
           redirect_to events_path
       end
    end
    
end