class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string 'title'
      t.text 'short_description'
      t.text 'long_description'
      t.string 'address'
      t.timestamp 'date'
      t.integer 'user_id'
    end
  end
end
