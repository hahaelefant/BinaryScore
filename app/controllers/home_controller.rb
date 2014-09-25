require 'net/http'

class HomeController < ApplicationController
  def index
    resp = Net::HTTP.get_response(URI.parse("http://football-api.com/api/?Action=competitions&APIKey=c41c2c1f-8db7-9cce-3a555f3d5be2"))
    data = resp.body

    result = JSON.parse(data)
    @liga = result["Competition"].first
  end

  def table
    resp = Net::HTTP.get_response(URI.parse(""))
  end
end