feature 'Testing name fill' do
  scenario 'Can receive names' do
    sign_in_and_play
    expect(page).to have_text("Jennifer")
    expect(page).to have_text("Chris")
  end
end
