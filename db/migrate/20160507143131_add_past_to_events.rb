class AddPastToEvents < ActiveRecord::Migration
  def change
    add_column :events, :past, :boolean
  end
end
