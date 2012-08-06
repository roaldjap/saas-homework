class WrongNumberOfPlayersError < StandardError; end
class NoSuchStrategyError < StandardError; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError, game.length unless game.length == 2
  # strategies to loose for P1
  strategies = {'P' => 'S', 'S' => 'R', 'R' => 'P'}
  all_strategies = strategies.keys
  player1, player2 = game
  raise NoSuchStrategyError, player1[1] if all_strategies.index(player1[1].upcase) == nil
  raise NoSuchStrategyError, player2[1] if all_strategies.index(player2[1].upcase) == nil
  if strategies[player1[1]] == player2[1]
    return player2
  else
    return player1
  end
end

def rps_tournament_winner(tournament)
  raise WrongNumberOfPlayersError, tournament unless tournament.length == 2
  branch1, branch2 = tournament
  if branch1[1].kind_of? String and branch2[1].kind_of? String
    return rps_game_winner(tournament)
  else
    return rps_game_winner([rps_tournament_winner(branch1), rps_tournament_winner(branch2)])
  end
end