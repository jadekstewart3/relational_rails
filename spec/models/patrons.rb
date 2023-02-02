require 'rails_helper'
RSpec.describe Patron do 
  describe 'parent relationship' do 
    it {should belong_to :climbing_gym}
  end
end