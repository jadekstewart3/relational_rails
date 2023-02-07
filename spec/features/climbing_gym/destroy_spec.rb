require 'rails_helper'

RSpec.describe 'destroying a climbing gym' do
  it 'can delete a climbing gym from the show page' do
    gym = ClimbingGym.create!(name: "Vertical Ventures", city: "Denver", number_of_routes: 600, classes_offered: true)
    visit "/climbing_gym/#{gym.id}"
  
    click_link "Delete #{gym.name}"

    expect(current_path).to eq("/climbing_gym")
    expect(page).to_not have_content("Vertical Ventures")
  end

  it 'can delete a climbing gym from the index page'  do 
    gym = ClimbingGym.create!(name: "Vertical Ventures", city: "Denver", number_of_routes: 600, classes_offered: true)

    visit "/climbing_gym"

    click_link "Delete #{gym.name}"
    
    expect(current_path).to eq("/climbing_gym")
    expect(page).to_not have_content("Vertical Ventures")
  end
end