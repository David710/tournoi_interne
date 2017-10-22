module GroupsHelper

  def set_match_score(player1, player2)
    # en entrée : le joueur 1 et le joueur 2
    match = Match.where(["player_1 = ? and player_2 = ?", player1, player2]).last
    if match
      score = match.score.to_s

      if score.length == 6
        prez_score = score[0] + " / " + score[1] + " - " + score[2] + " / " + score[3] + " - " + score[4] + " / " + score[5]
      else
        prez_score = score[0] + " / " + score[1] + " - " + score[2] + " / " + score[3]
      end
      if match.give_up
        prez_score = prez_score + " ab"
      end
    else
      prez_score = "Pas encore joué"
    end

    prez_score
  end

end
