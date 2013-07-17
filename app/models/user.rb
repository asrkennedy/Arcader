class User < ActiveRecord::Base
  has_secure_password
  has_many :matches

  attr_accessible :bio, :gender, :name, :password, :password_confirmation, :user_image, :username, :role

  mount_uploader :user_image, UserImageUploader

  def join_challenge
    match = Match.where(player1_id: self.id)
      match.each do |match|
      unless match.game_finished?
      match
      end
    end
  end

end
