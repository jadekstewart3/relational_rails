class ClimbingGymPatronsController < ApplicationController
  def index
    @gym = ClimbingGym.find(params[:id])
    @patrons = @gym.patrons
  end

  def new
    @gym = ClimbingGym.find(params[:id])
  end

  def create
    gym = ClimbingGym.find(params[:id])
    gym.patrons.create!(climbing_gym_patrons_params)
    redirect_to "/climbing_gym/#{gym.id}/patrons"
  end

  private
  def climbing_gym_patrons_params
    params.permit(:name, :years_member, :belay_certified)
  end
end