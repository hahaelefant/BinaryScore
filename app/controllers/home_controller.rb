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
    result = getJSON("fixtures&comp_id=1204&from_date=01.08.2014&to_date=31.06.2015")["matches"].first
    @data = result
  end

  def update
    #update teams
    result = getJSON("standings&comp_id=1204")["teams"]
    result.each do |team|
      t = Team.new
      t = Team.find(team["stand_team_id"]) if Team.find(team["stand_team_id"])
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
      t.save
    end

    #update matches, events and players
    result = getJSON("fixtures&comp_id=1204&from_date=01.08.2014&to_date=31.06.2015")["matches"]
    result.each do |match|
      match["match_events"].each do |event|
        p = Player.new
        p= Player.find(event["event_player_id"]) if Player.find(event["event_player_id"])
        p.id = event["event_player_id"]
        p.name= event["event_player"]
        p.team_id= match["match_localteam_id"] if event["event_team"] == "localteam"
        p.team_id= match["match_visitorteam_id"] if event["event_team"] == "visitorteam"
        p.save
      end
    end
  end
end