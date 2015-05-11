class MapController < ApplicationController
  attr_accessor :instagram_token

  def show
  end
  
  def test
    logger.debug "map:test"
    render text: "testing page"
  end

  def loggedin
    logger.debug "map:loggedin debugging"
    response = Instagram.get_access_token(params[:code], :redirect_uri => "http://127.0.0.1:3000/loggedin")
    @instagram_token = response.access_token
  end
end
