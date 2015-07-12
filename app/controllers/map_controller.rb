require 'open-uri'

class MapController < ApplicationController
  def show
    if logged_in?
      redirect_to current_user
    end
  end
  
  def search
    if logged_in?
      logger.debug "[DEBUG]: map::search"
      lat = params[:lat]
      lng = params[:lng]
      client = Instagram.client(:access_token => current_user.access_token)
      logger.debug "[DEBUG]: map::search instagram token is " + current_user.access_token 
      logger.debug "[DEBUG]: map::search username is " + client.user.username
      logger.debug "[DEBUG]: map::search full_name is " + client.user.full_name
      logger.debug "[DEBUG]: map::search profile_picture is " + client.user.profile_picture
      @images = ""
      for media_item in client.media_search(lat, lng)
        @images << "<img src='#{media_item.images.thumbnail.url}'>"
      end
      logger.debug "[DEBUG]: " << @images
    end
  end

end
