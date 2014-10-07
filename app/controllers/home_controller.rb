class HomeController < ApplicationController
  include ApplicationHelper

  def index
    result = getJSON "competitions"
    @data = result["Competition"]
  end

  def table
    result = getJSON "standings&comp_id=1204"
    @teams = result["teams"]
  end

  def error
    @ip = session[:ip]
    @error = session[:error]
  end

  def fixtures
    result = getJSON "fixtures&comp_id=1204&from_date=01.01.1990&to_date=01.07.2050"
    @data = result["matches"].first
  end
end