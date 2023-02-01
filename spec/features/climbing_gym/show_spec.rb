require 'rails_helper'

RSpec.describe 'the climbing gym show page' do 

  it 'displays the attributes of the climbing gym' do
    gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    visit "/climbing_gym/#{gym.id}"

    expect(page).to have_content(gym.city)
    expect(page).to have_content(gym.number_of_routes)
    expect(page).to have_content(gym.classes_offered)
  end
end