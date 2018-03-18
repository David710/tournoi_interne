module GroupsHelper

  def set_match_score(player1, player2)
    # en entrée : le joueur 1 et le joueur 2
    match = Match.where(["player_1 = ? and player_2 = ?", player1, player2]).last
    if match
      score = match.score.to_s

      if score.length == 6
        prez_score = score[0] + " / " + score[1] + " - " + score[2] + " / " + score[3] + " - " + score[4] + " / " + score[5]
      elsif score.length == 4
        prez_score = score[0] + " / " + score[1] + " - " + score[2] + " / " + score[3]
      elsif score.length == 2
        prez_score = score[0] + " / " + score[1]
      else
        prez_score = "saisir le score"
      end
      if match.give_up
        prez_score = prez_score + " ab"
      end

      if match.wo
        prez_score = "WO"
      end
    else
      prez_score = "Pas encore joué"
    end

    prez_score
  end

  def calc_scores(player)
    #prend en entrée une instance de Player
    group_id = player.group_id
    group_player_list = Group.find(group_id).players
    matches_group = []
    player_name = player.first_name + " " + player.last_name

    group_player_list.each do |adv|
      adv_name = adv.first_name + " " + adv.last_name
      # matches_group << Match.where(["player_1 = ? and player_2 = ?", player_name, adv_name]).last
      # matches_group << Match.where(["player_1 = ? and player_2 = ?", adv_name, player_name]).last

      matches_group << Match.where(["(player_1 = :player_name AND player_2 = :adv_name) OR (player_1 = :adv_name AND player_2 = :player_name)", { player_name: player_name, adv_name: adv_name }]).last
    end

    win = 0
    nb_matchs = 0
    wo = 0
    matches_group.each do |match|
      if match
        nb_matchs += 1
      end
      if (match && (match.winner == player_name))
        win += 1
      end
      if (match && (match.winner != player_name) && match.wo)
        wo += 1
      end
    end
    lost = nb_matchs - win
    score = win * 2 + lost - wo

    {win: win, lost: lost, score: score}
  end

  def set_match_name(player1, player2)
    # en entrée : le joueur 1 et le joueur 2
    match = Match.where(["player_1 = ? and player_2 = ?", player1, player2]).last
    if match
      if match.winner == player1
        html = '<span class= "winner">' + player1 + '</span>' + " - " + player2
      else
        html = player1 + " - " + '<span class= "winner">' + player2 + '</span>'
      end
    else
      html = player1 + " - " + player2
    end
    html
  end

end
