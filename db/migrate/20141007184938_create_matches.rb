class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches, id:false do |t|
      t.integer :id, null:false, unique: true
      t.date :date
      t.datetime :time
      t.integer :home_team
      t.integer :home_score
      t.integer :visitor_team
      t.integer :visitor_score

      t.timestamps
    end
    execute "ALTER TABLE matches ADD PRIMARY KEY (id);"
  end
end
