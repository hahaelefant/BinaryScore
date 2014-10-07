class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches, id:false do |t|
      t.integer :match_id, null:false, unique: true
      t.date :date
      t.datetime :time
      t.integer :hometeam
      t.integer :home_score
      t.integer :visitor
      t.integer :visitor_score

      t.timestamps
    end
    execute "ALTER TABLE matches ADD PRIMARY KEY (match_id);"
  end
end
