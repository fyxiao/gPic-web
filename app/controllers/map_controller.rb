require 'open-uri'

class MapController < ApplicationController
  @@instagram_token
  @images
  @profile_picture

  def show
  end
  
  def search 
    logger.debug "[DEBUG]: map::search"
    lat = params[:lat]
    lng = params[:lng]
    client = Instagram.client(:access_token => @@instagram_token)
    logger.debug "[DEBUG]: map::search instagram token is " + @@instagram_token
    logger.debug "[DEBUG]: map::search username is " + client.user.username
    logger.debug "[DEBUG]: map::search full_name is " + client.user.full_name
    logger.debug "[DEBUG]: map::search profile_picture is " + client.user.profile_picture
    @profile_picture = client.user.profile_picture
    open('app/assets/images/profile_picture.jpg', 'wb') do | file|
      file << open(@profile_picture).read
      logger.debug "[DEBUG]: map::search downloaded the profile picture"
    end
    @images = ""
    for media_item in client.media_search(lat, lng)
      @images << "<img src='#{media_item.images.thumbnail.url}'>"
    end
    logger.debug "[DEBUG]: " << @images
  end

end
