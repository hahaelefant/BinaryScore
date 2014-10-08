class AddAttributesToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :wins, :integer
    add_column :teams, :draws, :integer
    add_column :teams, :defeats, :integer
    add_column :teams, :goals_scored, :integer
    add_column :teams, :goals_conceded, :integer
    add_column :teams, :goaldifference, :integer
    add_column :teams, :points, :integer
  end
end
