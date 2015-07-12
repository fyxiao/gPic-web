require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username:"snoopdogg", full_name:"Snoop Dogg", profile_picture:"http://images.ak.instagram.com/profiles/anonymousUser.jpg", access_token:"testtoken")
  end

  test "should be valid" do
    assert @user.valid?
  end
    
end
