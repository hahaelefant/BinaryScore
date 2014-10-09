json.array!(@matches) do |match|
  json.extract! match, :id, :date, :time, :home_team, :home_score, :visitor_team, :visitor_score
  json.url match_url(match, format: :json)
end
