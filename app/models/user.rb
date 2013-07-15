class User < ActiveRecord::Base
  has_secure_password
  has_many :matches

  attr_accessible :bio, :gender, :name, :password, :password_confirmation, :user_image, :username

  mount_uploader :user_image, UserImageUploader
end
