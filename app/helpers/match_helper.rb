module MatchHelper

  def render_move(match, coord)
    move = Move.where(match_id: match, move_square: coord).first
    if move
      move
    else
      false
    end
  end

end

