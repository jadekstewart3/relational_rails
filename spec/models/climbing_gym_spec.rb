require 'rails_helper'

RSpec.describe ClimbingGym do 
  describe 'child relationship' do
    it { should have_many :patrons }
  end

  describe '#by_created_at' do
    it 'sorts climbing gyms by most recently created' do
      gym_1 = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true, created_at: Date.today)
      gym_2 = ClimbingGym.create!(name: "Vertical Ventures", city: "Denver", number_of_routes: 300, classes_offered: false, created_at: Date.tomorrow)
      gym_3 = ClimbingGym.create!(name: "EarthTreks", city: "Englewood", number_of_routes: 1000, classes_offered: true, created_at: Date.yesterday)
      gym_4 = ClimbingGym.create!(name: "The Spot", city: "Denver", number_of_routes: 600, classes_offered: true)

      expect(ClimbingGym.by_created_at).to eq([gym_2, gym_4, gym_1, gym_3])
    end
  end
end
