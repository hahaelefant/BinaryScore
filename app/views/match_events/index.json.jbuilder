json.array!(@match_events) do |match_event|
  json.extract! match_event, :id, :id, :eventtype, :minute, :hoeteam, :player_id, :score, :match_id
  json.url match_event_url(match_event, format: :json)
end
