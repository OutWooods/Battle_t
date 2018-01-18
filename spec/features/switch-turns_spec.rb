feature 'switch turns' do

  scenario 'change attacker on switch turns' do
    sign_in_and_play
    click_button("Switch turns")
    expect(page).to have_content("Attacker is now Chris")
    expect(page).to_not have_content("Attacker is now Jennifer")
  end

  scenario 'refreshing attack pag should not decrease HP' do
    sign_in_and_play
    click_button("Switch turns")
    visit("/play?")
    expect(page).to have_content("Attacker is now Chris")
    expect(page).to_not have_content("Attacker is now Jennifer")
  end

end
