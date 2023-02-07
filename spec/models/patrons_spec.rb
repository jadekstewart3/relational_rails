require 'rails_helper'
RSpec.describe Patron do 
  describe 'parent relationship' do 
    it {should belong_to :climbing_gym}
  end
  describe '#is_belay_certified' do
    it 'filters patron by belay status' do
      gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
      patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 10, belay_certified: true)
      patron_2 = gym.patrons.create!(name: 'Billie Jo McMurren', years_member: 6, belay_certified: false)
      patron_3 = gym.patrons.create!(name: 'Sean Morris', years_member: 8, belay_certified: true)

      expect(Patron.is_belay_certified).to eq([patron_1, patron_3])
    end
  end

  describe '#sort_alphabetically' do 
    it 'sorts partons alphabetically' do
      gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
      patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 10, belay_certified: true)
      patron_2 = gym.patrons.create!(name: 'Billie Jo McMurren', years_member: 6, belay_certified: false)
      patron_3 = gym.patrons.create!(name: 'Sean Morris', years_member: 8, belay_certified: true)

      expect(Patron.sort_alphabetically).to eq([patron_2, patron_1, patron_3])
    end
  end
  describe '#filter_patrons' do
    it 'can filter patrons by membership length' do
      gym = ClimbingGym.create(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
      patron_1 = gym.patrons.create!(name: 'Jade Stewart', years_member: 10, belay_certified: true)
      patron_2 = gym.patrons.create!(name: 'Billie Jo McMurren', years_member: 6, belay_certified: true)

      expect(Patron.filter_patrons(7)).to eq([patron_1])
    end
  end
end