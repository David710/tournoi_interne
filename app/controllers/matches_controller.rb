class MatchesController < ApplicationController

  def new
    @player1 = eval(params[:players])[:player1]
    @player2 = eval(params[:players])[:player2]
    @group = Group.find(params[:group_id])
    @match = @group.matches.new(player_1: @player1, player_2: @player2)
  end

  def create
    @group = Group.find(params[:group_id])

    @player1 = eval(params["players"])[:player1]
    @player2 = eval(params["players"])[:player2]

    @score = (params["score"]["set1_1"] + params["score"]["set1_2"] + params["score"]["set2_1"] + params["score"]["set2_2"] + params["score"]["set3_1"] + params["score"]["set3_2"]).to_i

    if (params["match"]["give_up"]).to_i == 1 then
      @give_up = true
    else
      @give_up = false
    end

    if (params["match"]["wo"]).to_i == 1 then
      @wo = true
    else
      @wo= false
    end

    if params["win"] == "player1" then
      @winner = @player1
    else
      @winner= @player2
    end

    @match = @group.matches.new(player_1: @player1, player_2: @player2, score: @score, give_up: @give_up, wo: @wo, winner: @winner)
    @match.save
    redirect_to "/groups/#{@group.id}"
  end

  # private
  #   def match_params
  #     params.require(:article).permit(:title, :text)
  #   end

end
