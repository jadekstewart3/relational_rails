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

  it 'can delete a patron from the index page' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Philip DeFraties', years_member: 6, belay_certified: true)
    patron_2 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)

    visit "/patrons"

    click_link "Delete #{patron_1.name}"

    expect(current_path).to eq("/patrons")
    expect(page).to_not have_content("Philip DeFraties")
    expect(page).to have_content("Jade Stewart")
  end
end