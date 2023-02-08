require 'rails_helper' 
RSpec.describe 'the climbing gyms index page' do
  describe 'the climbing gym index page' do
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

    it 'displays the climbing gyms by most recently created' do
      gym_1 = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true, created_at: Date.today)
      gym_2 = ClimbingGym.create!(name: "Vertical Ventures", city: "Denver", number_of_routes: 300, classes_offered: false, created_at: Date.tomorrow)
      gym_3 = ClimbingGym.create!(name: "EarthTreks", city: "Englewood", number_of_routes: 1000, classes_offered: true, created_at: Date.yesterday)
      gym_4 = ClimbingGym.create!(name: "The Spot", city: "Denver", number_of_routes: 600, classes_offered: true)
      visit "/climbing_gym"
      displayed_gym_1 = page.find_by_id("gym-0").text
      displayed_gym_2 = page.find_by_id("gym-1").text
      displayed_gym_3 = page.find_by_id("gym-2").text
      displayed_gym_4 = page.find_by_id("gym-3").text

      expect(displayed_gym_1.include?(gym_2.name)).to be(true) 
      expect(displayed_gym_2.include?(gym_4.name)).to be(true) 
      expect(displayed_gym_3.include?(gym_1.name)).to be(true)
      expect(displayed_gym_4.include?(gym_3.name)).to be(true)


      expect("Vertical Ventures").to appear_before("The Spot", only_text: true)
      expect("The Spot").to appear_before("Movement", only_text: true)
      expect("Movement").to appear_before("EarthTreks", only_text: true)
    end

    it 'links to the patrons index page' do
      visit "/climbing_gym"

      click_on "Patrons"

      expect(current_path).to eq("/patrons")
    end
  end 

  describe 'sort climbing gyms by number of patrons' do
    it 'displays sorted gyms by number of patrons' do
    gym_1 = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    gym_2 = ClimbingGym.create!(name: "Vertical Ventures", city: "Denver", number_of_routes: 300, classes_offered: false)
    gym_3 = ClimbingGym.create!(name: "EarthTreks", city: "Englewood", number_of_routes: 1000, classes_offered: true)

    patron_1 = gym_1.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
    patron_2 = gym_1.patrons.create!(name: 'Philip DeFraties', years_member: 6, belay_certified: true)

    patron_3 = gym_2.patrons.create!(name: 'Sean Morris', years_member: 7, belay_certified: true)
    patron_4 = gym_2.patrons.create!(name: 'Denise Corona', years_member: 2, belay_certified: true)
    patron_5 = gym_2.patrons.create!(name: 'Billie Jo McMurren', years_member: 2, belay_certified: false)

    patron_6 = gym_3.patrons.create!(name: 'Hannah Conlisk', years_member: 2, belay_certified: false)
    patron_7 = gym_3.patrons.create!(name: 'Zach Hazelwood', years_member: 2, belay_certified: false)
    patron_8 = gym_3.patrons.create!(name: 'Amy Nelson', years_member: 2, belay_certified: false)
    patron_9 = gym_3.patrons.create!(name: 'Corey Thompson', years_member: 2, belay_certified: false)
    
    visit "/climbing_gym"
    click_on 'Sort Gyms by Number of Patrons'

    expect(current_path).to eq("/climbing_gym")

    expect("EarthTreks").to appear_before("Vertical Ventures")
    expect("Vertical Ventures").to appear_before("Movement")
    end
  end
end