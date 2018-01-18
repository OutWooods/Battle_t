feature 'displays hitpoints' do
  scenario 'when one player dies, game says its over' do
    sign_in_and_play
    nearly_kill
    click_button("Attack!")
    expect(page).to_not have_selector("input[type=submit][value='Next move...!']")
    expect(page).to have_content("Game over")
  end

  scenario 'when player is close to death, the game is not over' do
    sign_in_and_play
    nearly_kill
    expect(page).to_not have_content("game over")
  end
end
