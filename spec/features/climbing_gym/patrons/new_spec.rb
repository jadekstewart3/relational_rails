require 'rails_helper'

RSpec.describe 'new patron creation' do 
  it 'links to the new page from the gym patron index' do 
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)

    visit "climbing_gym/#{gym.id}/patrons"

    click_link 'Create Patron'

    expect(current_path).to eq("/climbing_gym/#{gym.id}/patrons/new")
  end

  it 'can create a new patron' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)

    visit "climbing_gym/#{gym.id}/patrons/new"

    fill_in 'Name', with:'Brianna Campos'
    fill_in 'Years member', with: 0
    fill_in 'Belay certified', with: true

    click_on 'Create Patron'

    expect(current_path).to eq("/climbing_gym/#{gym.id}/patrons")
    expect(page).to have_content("Brianna Campos")
  end
end