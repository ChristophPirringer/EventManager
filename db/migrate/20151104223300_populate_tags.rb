class PopulateTags < ActiveRecord::Migration

  def change
    drop_table :tags

    create_table :tags do |t|
      t.string 'name'
      t.integer 'event_id'
    end
  end

end
