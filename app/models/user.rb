class User < ActiveRecord::Base
  attr_accessible :password, :username, :rights
end
