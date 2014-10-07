json.array!(@teams) do |team|
  json.extract! team, :id, :id, :name, :position
  json.url team_url(team, format: :json)
end
