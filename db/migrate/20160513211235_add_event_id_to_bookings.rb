class AddEventIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :event_id, :integer
  end
end
