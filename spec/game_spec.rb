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
      describe  "#attacker" do
        it 'starts with player_1 as attacker' do
          expect(game.attacker).to eq player_1
        end

        it 'initializes player 1' do
          expect(game.defender).to eq player_2
        end
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

     describe "#over?" do
       it "returns false if both player_1 and player 2 's are above 0" do
         allow(player_1).to receive(:hp).and_return(100)
         allow(player_2).to receive(:hp).and_return(100)
         expect(game.over?).to be false
       end

       it "returns true if player_1's health is 0" do
         allow(player_1).to receive(:hp).and_return(0)
         allow(player_2).to receive(:hp).and_return(100)
         expect(game.over?).to be true
       end

       it "returns true if player 2's health is 0" do
         allow(player_1).to receive(:hp).and_return(100)
         allow(player_2).to receive(:hp).and_return(0)
         expect(game.over?).to be true
       end
     end
end
