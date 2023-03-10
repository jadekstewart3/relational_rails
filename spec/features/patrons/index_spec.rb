require 'rails_helper' 

RSpec.describe 'the patrons index page' do
  it 'displays the names of all of the patrons' do 
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
    patron_2 = gym.patrons.create!(name: 'Philip DeFraties', years_member: 6, belay_certified: true)
    visit "/patrons"

    expect(page).to have_content(patron_1.name)
    expect(page).to have_content(patron_2.name)
  end

  it 'displays patrons attributes' do 
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
    patron_2 = gym.patrons.create!(name: 'Philip DeFraties', years_member: 6, belay_certified: true)
    visit "/patrons"

    expect(page).to have_content("Years a member: #{patron_1.years_member}")
    expect(page).to have_content("Years a member: #{patron_2.years_member}")
    expect(page).to have_content("Belay Certified: #{patron_1.belay_certified}")
    expect(page).to have_content("Belay Certified: #{patron_2.belay_certified}")
  end

  it 'links to the climbing gym index page' do
    gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)

    visit "/patrons"

    click_on "Climbing Gyms"

    expect(current_path).to eq("/climbing_gym")
  end

  it 'displays patrons that are belay certified' do
    gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
    patron_2 = gym.patrons.create!(name: 'Billie Jo McMurren', years_member: 6, belay_certified: false)

    visit "/patrons"

    expect(page).to have_content("Jade Stewart")
    expect(page).to have_no_content("Billie Jo McMurren")
  end
end