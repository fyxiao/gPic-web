class UsersController < ApplicationController
  @@instagram_token
  @@username
  @@profile_picture
  @images

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    logger.debug "[DEBUG]: users:create"
    @user = User.new(:user)
    if @user.save
      render 'loggedin'
    else
      render 'new'
    end
  end
  
  def loggedin
    response = Instagram.get_access_token(params[:code], :redirect_uri =>
                                          "http://127.0.0.1:3000/loggedin")
    @@instagram_token = response.access_token
    logger.debug "[DEBUG]: users:loggedin debugging, instagram token is " + @@instagram_token
    client = Instagram.client(:access_token => @@instagram_token)
    @@profile_picture = client.user.profile_picture
    logger.debug "[DEBUG]: users::search profile_picture is " + client.user.profile_picture
    
    if !User.exists?(username: client.user.username)
      render 'create'
    else
      #render ('?id=' + User.find_by(username: client.user.username).id.to_s)
      redirect_to action: "show", id: User.find_by(username: client.user.username).id
    end
  end

end
