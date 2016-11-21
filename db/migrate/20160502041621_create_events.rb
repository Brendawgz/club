class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.integer :capacity
      t.string :theme
      t.timestamps
    end
  end
end
