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

  def self.teammatches
    matches = Hash.new [0]
    allMatches = Match.find(:all, :order => "date")
    puts allMatches.length
    allMatches.each do |match|
      homePoints = 0
      awayPoints = 0
      if match.home_score > match.visitor_score
        homePoints = 3
      elsif match.home_score == match.visitor_score
        homePoints = 1
        awayPoints = 1
      else
        awayPoints = 3
      end
      puts "#{match.hometeam.name}:#{match.visitorteam.name}"
      puts "#{matches[match.hometeam.name.to_sym].length}:#{matches[match.visitorteam.name.to_sym].length}"

      if matches.has_key? match.hometeam.name.to_sym
        matches[match.hometeam.name.to_sym].push(matches[match.hometeam.name.to_sym].last + homePoints)
      else
        matches[match.hometeam.name.to_sym] = [homePoints]
      end


      if matches.has_key? match.visitorteam.name.to_sym
        matches[match.visitorteam.name.to_sym].push(matches[match.visitorteam.name.to_sym].last + awayPoints)
      else
        matches[match.visitorteam.name.to_sym].push(awayPoints)
      end
    end
    matches.sort {|a,b| a.last <=> b.last}
    puts matches.sort {|a,b|a.last <=> b.last}
    return matches
  end
end
