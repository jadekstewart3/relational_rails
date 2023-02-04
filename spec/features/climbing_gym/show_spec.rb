require 'rails_helper'

RSpec.describe 'the climbing gym show page' do 

  it 'displays the attributes of the climbing gym' do
    gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    visit "/climbing_gym/#{gym.id}"

    expect(page).to have_content(gym.city)
    expect(page).to have_content(gym.number_of_routes)
    expect(page).to have_content(gym.classes_offered)
  end

  it 'displays the number of patrons that belong to the gym' do 
    gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    patron_1 = gym.patrons.create!(name: 'Sean Morris', years_member: 7, belay_certified: true)
    patron_2 = gym.patrons.create!(name: 'Brianna Campos', years_member: 2, belay_certified: true)
    visit "/climbing_gym/#{gym.id}"

    expect(page).to have_content("Patrons: #{gym.patrons.count}")
  end

  it 'links to the patrons index page' do
    gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    visit "/climbing_gym/#{gym.id}"

    click_on "Patrons"

    expect(current_path).to eq("/patrons")
  end

  it 'links to the climbing gyms index page' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    visit "/climbing_gym/#{gym.id}"

    click_on "Climbing Gyms"

    expect(current_path).to eq("/climbing_gym")
  end
end