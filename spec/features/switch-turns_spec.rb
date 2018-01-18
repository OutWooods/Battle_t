feature 'switch turns' do

   background do
     sign_in_and_play
     click_button("Switch turns")
   end

  scenario 'change attacker on switch turns' do
    expect(page).to have_content("Attacker is now Chris")
    expect(page).to_not have_content("Attacker is now Jennifer")
  end

  scenario 'defender should have changed' do
    click_button("Attack!")
    expect(page).to have_content("Jennifer's HP is now 90.")
  end
end
