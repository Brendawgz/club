class EventBooking < ActiveRecord::Base
   belongs_to :event
   belongs_to :booking
end