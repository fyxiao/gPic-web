class MapController < ApplicationController
  @@instagram_token
  @images

  def show
  end
  
  def search 
    logger.debug "[DEBUG]: map::search"
    lat = params[:lat]
    lng = params[:lng]
    logger.debug "[DEBUG]: map::search instagram token is " + @@instagram_token
    client = Instagram.client(:access_token => @@instagram_token)
    @images = ""
    for media_item in client.media_search(lat, lng)
      @images << "<img src='#{media_item.images.thumbnail.url}'>"
      #images.push "<img src='#{media_item.images.standard_resolution.url}'>"
    end
    logger.debug "[DEBUG]: " << @images
  end

  def loggedin
    response = Instagram.get_access_token(params[:code], :redirect_uri => 
                "http://127.0.0.1:3000/loggedin")
    @@instagram_token = response.access_token
    logger.debug "[DEBUG]: map:loggedin debugging, instagram token is " + @@instagram_token
  end

end
