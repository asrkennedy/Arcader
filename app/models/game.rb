class Game < ActiveRecord::Base
has_many :matches

  attr_accessible :description, :game_image, :instructions, :name

  mount_uploader :game_image, GameImageUploader
end
