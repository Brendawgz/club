class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.boolean :attendance
      t.decimal :cost
      t.boolean :payment
      t.integer :guests
      t.integer :user_id
      t.timestamps
    end
  end
end
