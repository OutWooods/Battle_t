require "game"

describe Game do
  let (:player_1) {double :Player, hp: 100}
  let (:player_2) {double :Player, hp: 100}

  describe "Game Class tests" do
    it "should create a new instance of game and store" do
      Game.create(player_1, player_2)
      expect(Game.current).to be_a(Game)
    end
  end
end
