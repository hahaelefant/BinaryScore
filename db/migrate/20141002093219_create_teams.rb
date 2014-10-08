class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, id: false do |t|
      t.integer :id, null: false, unique:true
      t.string :name
      t.integer :position

      t.timestamps
    end
    execute "ALTER TABLE teams ADD PRIMARY KEY (id);"
  end
end
