require 'rails_helper'

RSpec.describe ClimbingGym do 
  describe 'child relationship' do
    it {should have_many :patrons }
  end

  describe '#sort' do 
    it 'orders records by most recently created' do 
      @gym_1 = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
      @gym_2 = ClimbingGym.create!(name: "Vertical Ventures", city: "Denver", number_of_routes: 300, classes_offered: false)
      @patron_1 = @gym_1.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
      @patron_2 = @gym_1.patrons.create!(name: 'Philip DeFraties', years_member: 6, belay_certified: true)
      @patron_3 = @gym_2.patrons.create!(name: 'Sean Morris', years_member: 7, belay_certified: true)
      @patron_4 = @gym_2.patrons.create!(name: 'Denise Corona', years_member: 2, belay_certified: true)

      expect(ClimbingGym.sort).to eq([@gym_2, @gym_1])
    end
  end
end
