class User < ActiveRecord::Base
  has_many :forums
  validates :username, :password, presence: true
  validates_uniqueness_of :username  
end
