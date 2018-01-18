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
end
