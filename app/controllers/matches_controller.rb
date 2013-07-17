class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def create
    @game = Game.find params[:game_id]
    @match = Match.create! game_id: @game.id, player1_id: current_user.id, player2_id: params[:opponent_id]
    redirect_to @match
  end

  def move
    @match = Match.find params[:id]
    is_first_move = @match.moves.size < 1
    Move.move(@match, current_user, params[:coord], is_first_move)
    redirect_to @match
  end

  def user
    @users = User.all
    @game = Game.find(params[:game_id])
  end

end