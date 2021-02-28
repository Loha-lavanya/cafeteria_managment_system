class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 8 }
  has_many :orders
end
