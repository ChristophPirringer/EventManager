class CreateCoordinates < ActiveRecord::Migration
  def change
    add_column :events, :latitude, :float
    add_column :events, :longitude, :float
    remove_column :tags, :event_id
  end
end
