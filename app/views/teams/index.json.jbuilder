json.array!(@teams) do |team|
  json.extract! team, :id, :name, :position, :wins, :draws, :defeats, :goals_scored, :goals_conceded, :goaldifference, :points
  json.url team_url(team, format: :json)
end
