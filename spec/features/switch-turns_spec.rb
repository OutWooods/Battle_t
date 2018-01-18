feature 'switch turns' do

  scenario 'change attacker on switch turns' do
    sign_in_and_play
    click_button("Switch turns")
    expect(page).to have_content("Attacker is now Chris")
    expect(page).to_not have_content("Attacker is now Jennifer")
  end

  context "after switching turns attack should hit other player" do
    background do
    sign_in_and_play
    click_button("Switch turns")
    click_button("Attack!")
    end

    scenario "player 1's health should be changed" do
    expect(page).to_not have_content("Chris's HP is now 90.")
    expect(page).to have_content("Jennifer's HP is now 90.")
    end

    scenario "player 1 should have been attacked" do
      expect(page).to_not have_content("Chris has been struck!")
      expect(page).to have_content("Jennifer has been struck!")
    end
  end


end
