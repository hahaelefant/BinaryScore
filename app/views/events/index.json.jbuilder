json.array!(@events) do |event|
  json.extract! event, :id, :event_id, :match_id, :type, :minute, :hometeam, :player_id, :score
  json.url event_url(event, format: :json)
end
