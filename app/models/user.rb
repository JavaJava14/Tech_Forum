class User < ActiveRecord::Base
  has_many :forums
end
