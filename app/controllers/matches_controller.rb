class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @game = Game.find params[:game_id]
    @match = Match.create! game_id: @game.id, player1_id: current_user.id
    redirect_to @match
  end

end