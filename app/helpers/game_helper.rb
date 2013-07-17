module GameHelper

  def top_scorer_for_game(game)
    winners = Match.where('game_id = ? AND winner IS NOT NULL', 4).group_by(&:winner)
    if winners.size < 1
      return "No winners"
    end
    biggest = winners.first
    winners.each do |winner, wins|
      if wins.size > biggest.size
        biggest = winner
      end
    end
    [biggest, biggest[1].size]
  end

end


