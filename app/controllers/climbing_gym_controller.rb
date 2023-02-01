class ClimbingGymController < ApplicationController
  def index
    @climbing_gyms = ClimbingGym.all
  end
end