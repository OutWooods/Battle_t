# describe "Testing infrastructure", :type => :feature do
feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content "Battle! Sign in to play: Player 1 name Player 2 name"
  end
end
