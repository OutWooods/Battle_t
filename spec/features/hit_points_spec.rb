feature 'displays hitpoints' do
  scenario 'Show both players HP at start of game' do
    sign_in_and_play
    expect(page).to have_content("Chris's HP: 100")
    expect(page).to have_content("Jennifer's HP: 100")
  end
end
