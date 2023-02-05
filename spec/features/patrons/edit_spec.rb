require 'rails_helper'

RSpec.describe 'edit an existing patron' do
  it 'links to the edit page' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_2 = gym.patrons.create!(name: 'Philip DFraties', years_member: 6, belay_certified: true)

    visit "/patrons/#{patron_2.id}"
    click_on 'Update Patron'

    expect(current_path).to eq("/patrons/#{patron_2.id}/edit")
  end

  it 'can edit the patron' do 
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_2 = gym.patrons.create!(name: 'Philip DFraties', years_member: 6, belay_certified: true)

    visit "/patrons/#{patron_2.id}"

    expect(page).to have_content('Philip DFraties')

    click_on 'Update Patron'

    fill_in 'Name', with: 'Philip DeFraties'
    click_button 'Update Patron'

    expect(current_path).to eq("/patrons/#{patron_2.id}")
    expect(page).to have_content('Philip DeFraties')
  end
end