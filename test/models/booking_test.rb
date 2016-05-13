require 'test_helper'

class BookingTest < ActiveSupport::TestCase
   
   def setup
      @booking = Booking.new(attendance: true, cost: 100.00, payment: false, guests: 2, name: "Brendan", user_id: 1) 
   end
   
   test "event should be valid" do
       assert @booking.valid?
   end

end