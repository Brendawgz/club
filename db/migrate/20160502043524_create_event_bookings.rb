class CreateEventBookings < ActiveRecord::Migration
  def change
    create_table :event_bookings do |t|
      t.integer :event_id
      t.integer :booking_id
    end
  end
end
