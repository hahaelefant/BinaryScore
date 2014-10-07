json.array!(@players) do |player|
  json.extract! player, :id, :player_id, :name
  json.url player_url(player, format: :json)
end
