class CreateMatchEvents < ActiveRecord::Migration
  def change
    create_table :match_events, id:false do |t|
      t.integer :id, null:false, unique: true
      t.string :eventtype
      t.integer :minute
      t.integer :player_id
      t.string :player_name
      t.integer :team_id
      t.string :score
      t.integer :match_id

      t.timestamps
    end
    execute "ALTER TABLE match_events ADD PRIMARY KEY (id);"
  end
end
