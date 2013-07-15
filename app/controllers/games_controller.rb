class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def match
    g_id = Game.find(params[:id])
    m = Match.create! game_id: params[:g_id], player1_id: 9, player2_id: 10
    # m_id = m.id
    redirect_to match_path(m)
  end
end

