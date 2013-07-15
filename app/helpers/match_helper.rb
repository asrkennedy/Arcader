module MatchHelper

  def render_move(match, coord)
    move = Move.where(match_id: match, move_square: coord).first
    if move
      move
    else
      false
    end
  end

def last_move (match)
  m = Move.where(match_id: match)
  biggest = m.first.move_number
  m.each do |move|
    if m.move_number > biggest
      biggest = m.move_number
    end
  end
  m.move_number(biggest)
end

def current_move_type (match)
    if last_move(match).move_type == 'X'
      'O'
    else
      'X'
  end
end

def current_player_id (match)
  last_player = last_move(match).player_id
  p = Match.find(match).player1_id
  if p == last_player
    Match.find(match).player2_id
  else
    p
  end
end

def make_move(match, coord)
  if Move.where(match_id: match).empty?
  Move.create! match_id: match.id, move_square: coord.to_i, move_type: 'O', move_number: 0, player_id: Match.find(match).player1_id
  else
    Move.create! match_id: match.id, move_square: coord.to_i, move_type: current_move_type(match), move_number: last_move(match).move_number.to_i, player_id: current_player_id(match).to_i
  end
end


  def check_win(match, coord)
    m = Match.where(match_id: match)
    m.each do |match|
      match.moves.include?
  #     @columns = [
  #   ['a1','a2','a3'],
  #   ['b1','b2','b3'],
  #   ['c1','c2','c3'],
  #   ['a1','b1','c1'],
  #   ['a2','b2','c2'],
  #   ['a3','b3','c3'],
  #   ['a1','b2','c3'],
  #   ['c1','b2','a3']
  # ]

end
end
end

