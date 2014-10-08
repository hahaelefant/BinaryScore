class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, id:false do |t|
      t.integer :id, null:false, unique: true
      t.string :type
      t.integer :minute
      t.boolean :hometeam
      t.integer :player_id
      t.string :score
      t.integer :match_id

      t.timestamps
    end
    execute "ALTER TABLE events ADD PRIMARY KEY (id);"
  end
end
