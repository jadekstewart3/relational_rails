# User Story 20, Child Delete 

# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child
require 'rails_helper'

RSpec.describe 'destroying a patron' do
  it 'can delete a patron from the show page' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Philip DeFraties', years_member: 6, belay_certified: true)

    visit "/patrons/#{patron_1.id}"

    click_link "Delete #{patron_1.name}"

    expect(current_path).to eq("/patrons")
    expect(page).to_not have_content("Philip DeFraties")
  end
end