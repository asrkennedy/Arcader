class Move < ActiveRecord::Base
belongs_to :match
belongs_to :player, class_name: 'User'

  attr_accessible :match_id, :move_number, :move_square, :move_type, :player_id

  # def self.first_move(match, coord)
  #   Move.new match_id: match.id, player_id: match.player1_id, move_number: match.moves.count+1, move_square: coord, move_type: 'X'
  # end

  # def self.move_for_match(match, player, coord)
  #   # is player on game
  #   # is it player's turn
  #   # is square empty
  #   # is game not finished or won
  #   Move.new match_id: match.id, player_id: player.id, move_number: match.moves.count+1, move_square: coord, move_type: match.current_move_type
  # end

  def self.move match, player, coord, first_move
    if match.player1_id == player.id
      move = "X"
    else
      move = "O"
    end
    Move.create match_id: match.id, player_id: player.id, move_number: match.moves.count+1, move_square: coord, move_type: move
    match.calculate_if_is_finished!
  end
end
