require 'rails_helper'
RSpec.describe 'the patrons show page' do 
  it 'displays the name of the patron with associated id' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
    visit "/patrons/#{patron_1.id}"

    expect(page).to have_content(patron_1.name)
  end

  it 'displays the patrons attributes' do 
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
    visit "/patrons/#{patron_1.id}"

    expect(page).to have_content(patron_1.years_member)
    expect(page).to have_content(patron_1.belay_certified)
  end

  it 'links to the patrons index page' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
    visit "/patrons/#{patron_1.id}"

    click_on "Patrons"

    expect(current_path).to eq("/patrons")
  end

  it 'links to the climbing gyms index page' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
    visit "/patrons/#{patron_1.id}"

    click_on "Climbing Gyms"

    expect(current_path).to eq("/climbing_gym")
  end
end