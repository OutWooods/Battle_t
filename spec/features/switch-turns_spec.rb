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
