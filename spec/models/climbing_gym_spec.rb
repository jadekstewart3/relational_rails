require 'rails_helper'

RSpec.describe ClimbingGym do 
  describe 'child relationship' do
    it {should have_many :patrons }
  end
end