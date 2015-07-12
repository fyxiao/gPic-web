class SessionsController < ApplicationController
  def create 
    response = Instagram.get_access_token(params[:code], :redirect_uri => 
                                          HOME_PAGE_URL + '/login')
    @instagram_token = response.access_token
    logger.debug "[DEBUG]: sessions::create, instagram token is " + @instagram_token
    client = Instagram.client(:access_token => @instagram_token)
    @profile_picture = client.user.profile_picture
    logger.debug "[DEBUG]: sessions::search profile_picture is " + client.user.profile_picture
    open('app/assets/images/profile_picture.jpg', 'wb') do |file|
      file << open(@profile_picture).read
      logger.debug "[DEBUG]: sessions::create downloaded the profile picture"
    end
    
    if !User.exists?(username: client.user.username)
      @user = User.new(username: client.user.username, full_name: client.user.full_name,
                       profile_picture: client.user.profile_picture,
                       access_token: @instagram_token)
      @user.save
      logger.debug "[DEBUG]: sessions::create: saved a new User with username " + client.user.username
    else
      @user = User.find_by(username: client.user.username)
      logger.debug "[DEBUG]: sessions::create: user already exists"
    end

    log_in @user
    redirect_to @user
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
