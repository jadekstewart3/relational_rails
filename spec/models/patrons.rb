require 'rails_helper'
RSpec.describe Patron do 
  it {should belong_to :climbing_gym}
end