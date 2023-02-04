class ClimbingGymPatronsController < ApplicationController
  def index
    gym = ClimbingGym.find(params[:gym_id])
    @patrons = gym.patrons
  end
end