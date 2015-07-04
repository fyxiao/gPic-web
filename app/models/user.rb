class User < ActiveRecord::Base
  validates:username, presence:true
  validates:full_name, presence:true
  validates:profile_picture, presence:true
end
