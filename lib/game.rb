require_relative "player"

class Game

  attr_reader :players

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
  end

  def attacker
    @players.first
  end

  def defender
    @players.last
  end

  def hit(opponent)
    opponent.receive_damage
  end

  def switch
    @players.reverse!
  end

end
