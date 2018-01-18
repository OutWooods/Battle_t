require "game"

describe Game do
    let (:player_1) {double :Player}
    let (:player_2) {double :Player}
    subject(:game) { described_class.new(player_1, player_2) }

    describe "#hit" do
      it 'hits player_2 from player_1' do
        expect(player_2).to receive(:receive_damage)
        game.hit
      end
    end

    describe "#initialize" do
      it "should have player 1 in players" do
        expect(game.players).to include(player_1)
      end
      it "should have player 2 in players" do
        expect(game.players).to include(player_2)
      end
    end

    describe  "#attacker" do
      it 'starts with player_1 as attacker' do
        expect(game.attacker).to eq player_1
      end

      it 'initializes player 1' do
        expect(game.defender).to eq player_2
      end
    end

    describe  "#switch" do
      before do
        game.switch
      end
      it 'player 2 is attacker' do
        expect(game.attacker).to eq player_2
      end

      it 'player 1 is defender' do
        expect(game.defender).to eq player_1
      end

      it 'player 1 should recieve damage when attacked' do
        expect(player_1).to receive(:receive_damage)
        game.hit
      end
    end

end
