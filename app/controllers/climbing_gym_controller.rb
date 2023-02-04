class ClimbingGymController < ApplicationController
  def index
    @climbing_gyms = ClimbingGym.by_created_at
  end

  def show
    @climbing_gym = ClimbingGym.find(params[:id])
    @patrons = @climbing_gym.patrons.count
  end
end