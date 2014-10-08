class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, id:false do |t|
      t.integer :id, null: false, unique: true
      t.string :name
      t.integer :team_id

      t.timestamps
    end
    execute "ALTER TABLE players ADD PRIMARY KEY (id);"
  end
end
