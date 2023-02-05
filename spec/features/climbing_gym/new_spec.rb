require 'rails_helper'

RSpec.describe 'Climbing Gym creation' do

  it 'links to climbing gym new page from the climbing gym index' do
    visit "/climbing_gym"

    click_on 'New Climbing Gym' 

    expect(current_path).to eq('/climbing_gym/new')
  end

  it 'can create a new climbing gym' do
    visit '/climbing_gym/new'

    fill_in 'Name', with:'Denver Boulder Club'
    fill_in 'City', with: 'Denver'
    fill_in 'Number of routes', with: 400
    fill_in 'Classes offered', with: true

    click_on "Create Climbing Gym"
    
    expect(current_path).to eq("/climbing_gym")
    expect(page).to have_content("Denver Boulder Club")
  end
end