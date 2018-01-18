feature 'attack player' do
  background do
    sign_in_and_play
    click_button("Attack!")
  end
  scenario 'uses attack button' do
    expect(page).to have_content("Chris has been struck!")
  end

  scenario 'adjusts player HP' do
    expect(page).to have_content("Chris's HP is now 90.")
  end

  scenario 'refreshing attack pag should not decrease HP' do
    visit("/attack")
    expect(page).to have_content("Chris's HP is now 90.")
    expect(page).to_not have_content("Chris's HP is now 80.")
  end
end
