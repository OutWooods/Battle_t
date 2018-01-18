feature 'switch turns' do
  scenario 'change attacker on switch turns' do
    sign_in_and_play
    click_button("Switch turns")
    expect(page).to have_content("Attacker is now Chris")
  end

  scenario '' do
    sign_in_and_play
    click_button("Switch turns")
    click_button("Attack!")
    expect(page).to have_content("Jennifer's HP is now 90.")
  end
end
