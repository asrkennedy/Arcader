class Game < ActiveRecord::Base
  has_many :matches

  default_scope order('name ASC')
  attr_accessible :description, :game_image, :instructions, :name
end
