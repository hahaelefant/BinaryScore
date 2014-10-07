json.array!(@matches) do |match|
  json.extract! match, :id, :match_id, :date, :time, :hometeam, :home_score, :visitor, :visitor_score
  json.url match_url(match, format: :json)
end
