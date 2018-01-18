def sign_in_and_play
  visit('/')
  fill_in "name_1", :with => "Jennifer"
  fill_in "name_2", :with => "Chris"
  click_button "Submit"
end

def nearly_kill
  9.times{click_button("Attack!")
  click_button("Next move...!") }
end
