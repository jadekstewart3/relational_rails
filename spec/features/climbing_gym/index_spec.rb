require 'rails_helper' 
RSpec.describe 'the climbing gyms index page' do

   it 'displays the name of the climbing gym' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    visit "/climbing_gym"

    expect(page).to have_content(gym.name)
  end

  it 'displays the date and time the gym was created' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    visit "/climbing_gym"

    expect(page).to have_content("Created at: #{gym.created_at}")
  end

  it 'displays the city the gym is in' do
    gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    visit "/climbing_gym"

    expect(page).to have_content("Location: #{gym.city}")
  end
end