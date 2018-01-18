feature 'switch turns' do

    background do
      sign_in_and_play
      click_button("Switch turns")
    end
    scenario "attacker should change after one switch" do
      expect(page).to have_content("Attacker is now Chris")
      expect(page).to_not have_content("Attacker is now Jennifer")
    end

    scenario 'refreshing attack pag should not decrease HP' do
      visit("/play?")
      expect(page).to have_content("Attacker is now Chris")
      expect(page).to_not have_content("Attacker is now Jennifer")
    end

end

feature "switch and attack" do
      background do
        sign_in_and_play
        click_button("Switch turns")
        click_button("Attack!")
      end

      scenario "player 1's health should be changed after switch" do
        expect(page).to_not have_content("Chris's HP is now 90.")
        expect(page).to have_content("Jennifer's HP is now 90.")
      end

      scenario "attack message should change after switch" do
        expect(page).to_not have_content("Chris has been struck!")
        expect(page).to have_content("Jennifer has been struck!")
      end
end
