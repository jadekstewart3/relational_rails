# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe 'edit an existing climbing gym' do 
  it 'links to the edit page' do 
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)

    visit "/climbing_gym/#{gym.id}"
    click_button "Update #{gym.name}"

    expect(current_path).to eq("/climbing_gym/#{gym.id}/edit")
  end

  it 'can edit the climbing gym' do
    gym = ClimbingGym.create!(name: "Movmen", city: "Golden", number_of_routes: 500, classes_offered: true)
    visit "/climbing_gym/#{gym.id}"

    expect(page).to have_content("Movmen")

    click_button "Update #{gym.name}"

    fill_in 'Name', with: "Movement"
    click_button "Update #{gym.name}"

    expect(current_path).to eq("/climbing_gym/#{gym.id}")
    expect(page).to have_content("Movement")
  end
end