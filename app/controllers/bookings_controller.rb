class BookingsController < ApplicationController
    before_action :set_booking, only: [:edit, :update, :show, :destroy]
    before_action :require_user
    before_action :require_same_user, only: [:edit, :update, :show, :destroy]
    
    def index
        @bookings = Booking.all
    end
        
    def new
        @booking = Booking.new
        @events = Event.all.find_all { |event| !event.past }
    end
    
    def create
        @booking = Booking.new(booking_params)
        @booking.user = current_user
        @booking.payment = false
        @booking.cost = @booking.guests * 50
        @booking.events << Event.find(params[:booking][:event_ids])
        if @booking.save
            flash[:success] = "You've successfully created a booking"
            redirect_to bookings_path
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def update
        if @booking.update(booking_params)
            @booking.cost = @booking.guests * 50
            @booking.update(booking_params)
            flash[:success] = "You've successfully edited your booking"
            redirect_to bookings_path
        else
            render 'edit'
        end
    end
    
    def show
        
    end
    
    def destroy
        @booking.destroy
        redirect_to bookings_path
        flash[:danger] = "Event has been successfully cancelled"
    end
    
    private
    def booking_params
      params.require(:booking).permit(:cost, :payment, :guests, :name, event_ids: [:id])
    end
    
    def set_booking
        @booking = Booking.find(params[:id])
    end
    
    def require_same_user
      if current_user != @booking.user and !current_user.admin?
        flash[:danger] = 'You can only edit or delete your own bookings'
        redirect_to root_path
      end
    end
  
end