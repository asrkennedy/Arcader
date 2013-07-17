class Match < ActiveRecord::Base
  has_many :moves
  belongs_to :game
  belongs_to :player1, class_name: "User"
  belongs_to :player2, class_name: "User"

  attr_accessible :game_id, :loser, :player1_id, :player2_id, :winner

  def last_move
    moves.order(:move_number).last
  end

  def current_move_type
    return 'X' if moves.empty?
    last_move.move_type == 'X' ? 'O' : 'X'
  end

  def whose_turn
    if last_move == nil
      false
    else
      player1 == last_move.player ? player2 : player1
    end
  end

  def winning_lines
  [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  end

  def winning_game?
    winning_lines.detect do |winning_line|
      line = winning_line.map{|e| squares[e]}
     line.any? && line.uniq.size == 1
   end
  end


  def empty_square?(move_square)
    self.squares[move_square].nil?
  end

  def squares
    a = [nil,nil,nil,nil,nil,nil,nil,nil,nil]
    moves.each do |move|
      a[move.move_square] = move.move_type
    end

    return a
  end

  def game_finished?
    winning_game? || squares.all?
  end

 def match_winner
   last_move.player
  end

  def match_loser
    last_move.player == player1 ? player2 : player1
  end

  def calculate_if_is_finished!
    if game_finished?
        self.winner = match_winner.id
        self.loser = match_loser.id
        self.save!
    else
        squares.all?
        self.winner = nil
        self.loser = nil
        self.save!
    end
  end

end
