require 'rails_helper'

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

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