class RemoveAttendanceFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :attendance, :boolean
  end
end
