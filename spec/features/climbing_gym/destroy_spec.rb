
# User Story 19, Parent Delete 

# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
require 'rails_helper'

RSpec.describe 'destroying a climbing gym' do
  it 'can delete a climbing gym from the show page' do
    gym = ClimbingGym.create!(name: "Vertical Ventures", city: "Denver", number_of_routes: 600, classes_offered: true)
    visit "/climbing_gym/#{gym.id}"
  
    click_link "Delete #{gym.name}"

    expect(current_path).to eq("/climbing_gym")
    expect(page).to_not have_content("Vertical Ventures")
  end
end