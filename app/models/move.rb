class Move < ActiveRecord::Base
belongs_to :match

  attr_accessible :match_id, :move_number, :move_square, :move_type, :player_id
end
