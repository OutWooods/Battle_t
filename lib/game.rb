require_relative "player"

class Game

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
  end

  def self.create(player_1, player_2)
    @current_game = Game.new(player_1, player_2)
  end

  def self.current
    @current_game
  end

  def attacker
    @players.first
  end

  def defender
    @players.last
  end

  def hit
    defender.receive_damage
  end

  def switch
    @players.reverse!
  end

  def over?
    @players.each {|char| return true if char.hp <= 0}
    false
  end

end
