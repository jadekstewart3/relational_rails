# User Story 5, Parent Children Index 

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
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
  end
end