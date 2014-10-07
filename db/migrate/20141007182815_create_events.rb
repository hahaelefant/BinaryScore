class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, id:false do |t|
      t.integer :event_id, null:false, unique: true
      t.string :type
      t.integer :minute
      t.boolean :hometeam
      t.integer :player_id
      t.string :score

      t.belongs_to :matches

      t.timestamps
    end
    execute "ALTER TABLE events ADD PRIMARY KEY (event_id);"
  end
end
