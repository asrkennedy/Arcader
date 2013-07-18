module GameHelper

  def top_scorer_for_game(game)
    winners = Match.where('game_id = ? AND winner IS NOT NULL', game.id).group_by(&:winner)
    return "No winners" if winners.size < 1
    keys, values = winners.keys, winners.map{ |k,v| v.size}
    top_scorer_id = keys[values.index(values.max)]
    top_scorer_matches = values.max
    [top_scorer_id, top_scorer_matches]
  end

  def authenticated_link_to link_content, link_url, user
    if user

      link_to link_content, link_url
    else
      link_content
    end
  end
end


