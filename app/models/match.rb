class Match < ActiveRecord::Base
  has_many :moves
  belongs_to :game
  belongs_to :player1, class_name: "User"
  belongs_to :player2, class_name: "User"

  attr_accessible :game_id, :loser, :player1_id, :player2_id, :winner
end
