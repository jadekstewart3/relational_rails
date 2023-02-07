require 'rails_helper'

RSpec.describe 'Climbing Gyms Patrons Index' do
  describe '#index' do
    before :each do 
      @gym = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
      @patron_1 = @gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
      @patron_2 = @gym.patrons.create!(name: 'Philip DeFraties', years_member: 6, belay_certified: true)
    end
    it 'displays a list of all the gym patrons names' do
      visit "/climbing_gym/#{@gym.id}/patrons"

      expect(page).to have_content(@patron_1.name)
      expect(page).to have_content(@patron_2.name)
    end
    it 'displays number of years a patron has been a member of the gym' do 
      visit "/climbing_gym/#{@gym.id}/patrons"

      expect(page).to have_content("Membership length: #{@patron_1.years_member}")
      expect(page).to have_content("Membership length: #{@patron_2.years_member}")
    end

    it 'displays belay certification status' do 
      visit "/climbing_gym/#{@gym.id}/patrons"

      expect(page).to have_content("Belay Certified: #{@patron_1.belay_certified}")
      expect(page).to have_content("Belay Certified: #{@patron_2.belay_certified}")
    end

    it 'links to the patrons index page' do
      gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
      visit "/climbing_gym/#{gym.id}/patrons"

      click_on "Patrons"

      expect(current_path).to eq("/patrons")
    end

    it 'links to the climbing gym index page' do
      gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
      visit "/climbing_gym/#{gym.id}/patrons"

      click_on "Climbing Gyms"

      expect(current_path).to eq("/climbing_gym")
    end
  end

  describe 'sort patrons in alphabetical order' do 
    it 'sorts the patrons alphabetically' do
      gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
      patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
      patron_2 = gym.patrons.create!(name: 'Billie Jo McMurren', years_member: 6, belay_certified: true)
          
      visit "climbing_gym/#{gym.id}/patrons"

      click_on 'Sort Alphabetically'

      expect("Billie Jo McMurren").to appear_before("Jade Stewart")
    end
  end

  describe 'display records over a given threshold' do
    it 'dislays members who have been members over a certain number of years' do
      gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
      patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 10, belay_certified: true)
      patron_2 = gym.patrons.create!(name: 'Billie Jo McMurren', years_member: 6, belay_certified: true)

      visit "climbing_gym/#{gym.id}/patrons"

      fill_in 'Filter Members by Membership Length', with: 7
      click_button 'Filter'

      expect(current_path).to eq("/climbing_gym/#{gym.id}/patrons/filter")
      expect(page).to_not have_content("Billie Jo McMurren")
    end
  end
end