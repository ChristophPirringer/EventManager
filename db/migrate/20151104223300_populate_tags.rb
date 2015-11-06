class PopulateTags < ActiveRecord::Migration

  def change
      create_table :tags do |t|
      t.string 'name'
      t.integer 'event_id'
    end
  end

end
