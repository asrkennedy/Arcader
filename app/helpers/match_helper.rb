module MatchHelper

  def render_move(match, coord)
    move = Move.where(match_id: match, move_square: coord).first
    if move
      move
    else
      false
    end
  end

  def get_move_type match, grid_case
    item = match.moves.where(move_square: grid_case).first
    puts "my current item -> #{item}"
    if item
      puts item.move_type
      item.move_type
    end
  end

end

