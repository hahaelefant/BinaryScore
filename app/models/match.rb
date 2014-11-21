class Match < ActiveRecord::Base
  has_many :match_events, dependent: :destroy
  belongs_to :Team, foreign_key: "home_team"
  belongs_to :Team, foreign_key: "visitor_team"

  def hometeam
    Team.find(home_team)
  end

  def visitorteam
    Team.find visitor_team
  end
end
