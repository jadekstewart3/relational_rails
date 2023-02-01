require 'rails_helper' 

RSpec.describe 'the patrons index page' do
  it 'displays the names of all of the patrons' do 
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(gym_id: 1, name: 'Jade Stewart', belay_certified: true)
    patron_2 = gym.patrons.create!(gym_id: 1, name: 'Philip DeFraties', belay_certified: true)
    visit "/patrons"

    expect(page).to have_content(patron_1.name)
    expect(page).to have_content(patron_2.name)
  end

  it 'displays patrons attributes' do 
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(gym_id: 1, name: 'Jade Stewart', belay_certified: true)
    patron_2 = gym.patrons.create!(gym_id: 1, name: 'Philip DeFraties', belay_certified: true)
    visit "/patrons"

    expect(page).to have_content(patron_1.gym_id)
    expect(page).to have_content(patron_2.gym_id)
    expect(page).to have_content(patron_1.belay_certified)
    expect(page).to have_content(patron_2.belay_certified)
  end
end