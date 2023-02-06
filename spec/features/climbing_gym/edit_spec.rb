require 'rails_helper'

RSpec.describe 'edit an existing climbing gym' do 
  describe 'it can edit the climbing gym from the show page' do
    it 'links to the edit page' do 
      gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)

      visit "/climbing_gym/#{gym.id}"
      click_button "Update #{gym.name}"

      expect(current_path).to eq("/climbing_gym/#{gym.id}/edit")
    end

    it 'can edit the climbing gym' do
      gym = ClimbingGym.create!(name: "Movmen", city: "Golden", number_of_routes: 500, classes_offered: true)
      visit "/climbing_gym/#{gym.id}"

      expect(page).to have_content("Movmen")

      click_button "Update #{gym.name}"

      fill_in 'Name', with: "Movement"
      click_button "Update #{gym.name}"

      expect(current_path).to eq("/climbing_gym/#{gym.id}")
      expect(page).to have_content("Movement")
    end
  end

  describe 'can edit the climbing gym from the index page' do 
    it 'links to the edit page' do 
      gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)

      visit "/climbing_gym"
      click_link "Update #{gym.name}"

      expect(current_path).to eq("/climbing_gym/#{gym.id}/edit")
    end
  end
end