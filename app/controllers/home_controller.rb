require 'date'
class HomeController < ApplicationController
  include ApplicationHelper

  def index
    result = getJSON "competitions"
    @data = result["Competition"]
  end

  def table
    result = getJSON("standings&comp_id=1204")["teams"]
    @teams = result.first
  end

  def error
    @ip = session[:ip]
    @error = session[:error]
  end

  def fixtures
    result = getJSON("fixtures&comp_id=1204&from_date=01.08.2014&to_date=31.06.2015")["matches"]
    @data = result
  end

  def livescores
    #result = getJSON("fixtures&comp_id=1204&&match_date=#{Date.today.strftime('%d.%m.%Y')}")["matches"]
    result = getJSON("fixtures&comp_id=1204&&match_date=18.10.2014")["matches"]
    @data = result
  end

  def topscorer
    @players = Hash.new(0)
    MatchEvent.all.each do |event|
      @players[event.player_name]+=1  if event.eventtype == "goal"
    end
    @players = @players.sort_by {|key, value| value}.reverse
  end

  def update
    #update teams
    result = getJSON("standings&comp_id=1204")["teams"]
    result.each do |team|
      t = Team.new
      t = Team.find(team["stand_team_id"]) if Team.exists?(team["stand_team_id"])
      t.id = team["stand_team_id"]
      t.position= team["stand_position"]
      t.defeats = team["stand_overall_l"]
      t.draws= team["stand_overall_d"]
      t.goaldifference= team["stand_gd"]
      t.goals_conceded= team["stand_overall_ga"]
      t.goals_scored= team["stand_overall_gs"]
      t.name= team["stand_team_name"]
      t.points= team["stand_points"]
      t.wins= team["stand_overall_w"]
      t.save unless Team.exists?(team["stand_team_id"]) && Team.find(team["stand_team_id"]) == t
    end

    #update matches, events and players
    result = getJSON("fixtures&comp_id=1204&from_date=01.08.2014&to_date=31.06.2015")["matches"]
    result.each do |match|
      #create or update Method
      m = Match.new
      m = Match.find(match["match_id"]) if Match.exists? match["match_id"]
      m.id = match["match_id"]
      m.date= match["match_formatted_date"]
      m.home_score= match["match_localteam_score"]
      m.home_team= match["match_localteam_id"]
      m.visitor_score= match["match_visitorteam_score"]
      m.visitor_team= match["match_visitorteam_id"]
      m.time= match["match_time"]
      m.save

      next if match["match_events"] == nil
      match["match_events"].each do |event|
        # next if MatchEvent.exists?(event["event_id"])

        #create or update events
        e = MatchEvent.new
        e.id = event["event_id"]
        e = MatchEvent.find event["event_id"] if MatchEvent.exists? event["event_id"]
        if event["event_team"]=="localteam"
          e.team_id = match["match_localteam_id"]
        else
          e.team_id = match["match_visitorteam_id"]
        end
        e.match_id= event["event_match_id"]
        e.minute= event["event_minute"]
        e.player_id= event["event_player_id"]
        e.score = event["event_result"]
        e.eventtype= event["event_type"]
        if(event["event_player"].index("(") != nil)
          event["event_player"].slice!(event["event_player"].index("(") - 1, event["event_player"].length)
        end
        if(event["event_player"].index(".") != 1 && event["event_player"].index(".") != nil)
          pointIndex = event["event_player"].index(".")
          first = event["event_player"].slice!(pointIndex-1,pointIndex+1)
          event["event_player"].slice!(event["event_player"].length - 1)
          e.player_name = "#{first} #{event["event_player"]}"
        else
          e.player_name = event["event_player"]
        end
        e.save
      end
    end
  end
end