require 'net/http'

module ApplicationHelper

  def getJSON action
    baseUrl = "http://football-api.com/api/?Action="
    _APIKey  = "&APIKey=c41c2c1f-8db7-9cce-3a555f3d5be2"
    url = "#{baseUrl}#{action}#{_APIKey}"
    resp = Net::HTTP.get_response(URI.parse(url))
    #resp = Net::HTTP.get_response(URI.parse("http://football-api.com/api/?Action=standings&APIKey=c41c2c1f-8db7-9cce-3a555f3d5be2&comp_id=1204"))
    data = JSON.parse(resp.body)
    session[:error] = data["ERROR"]
    session[:ip] = data["IP"]
    redirect_to :controller => "home", :action => "error" unless data["ERROR"] == "OK"
    data
  end
end
