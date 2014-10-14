class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key(:players, :teams, column: "team_id")
    add_foreign_key(:match_events, :matches, column: "match_id")
    add_foreign_key(:matches, :teams, column: "home_team")
    add_foreign_key(:matches, :teams, column: "visitor_team")
    add_foreign_key(:match_events, :players, column: "player_id")
  end
end
