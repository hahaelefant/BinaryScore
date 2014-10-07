class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, id:false do |t|
      t.integer :player_id, null: false, unique: true
      t.string :name

      t.belongs_to :team

      t.timestamps
    end
    execute "ALTER TABLE players ADD PRIMARY KEY (player_id);"
  end
end
