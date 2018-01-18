feature 'attack player' do
  scenario 'uses attack button' do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content("Chris has been struck!")
  end

  scenario 'adjusts player HP' do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content("Chris's HP is now 90.")
  end
end
