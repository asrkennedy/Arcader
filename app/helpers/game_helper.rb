module GameHelper

  def top_scorer_for_game(game)
    winners = Match.where('game_id = ? AND winner != ?', game.id, nil).group_by(&:winner)
    if winners.size < 1
      return "No winners"
    end
    biggest = winners.first
    winners.each do |winner, wins|
      if wins.size > biggest.size
        biggest = winner
      end
    end
    [biggest.first, biggest[1].size]
  end

end


