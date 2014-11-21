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

  def getWikiJSON title
    baseUrl = "http://en.wikipedia.org/w/api.php?page="
    params = "&action=parse&format=json&prop=text&section=0"
    url = "#{baseUrl}#{title}%20F.C.#{params}"
    url.sub! ' ', "%20"
    url.sub! ' ', "%20"
    resp = Net::HTTP.get_response(URI.parse url)
    data = JSON.parse(resp.body)
    data
  end
end
