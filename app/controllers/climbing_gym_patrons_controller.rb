class ClimbingGymPatronsController < ApplicationController
  def index
    @gym = ClimbingGym.find(params[:id])
    @patrons = @gym.patrons
  end

  def alpha_index
    @gym = ClimbingGym.find(params[:id])
    @patrons = @gym.patrons.sort_alphabetically
    render 'index'
  end

  def new
    @gym = ClimbingGym.find(params[:id])
  end

  def create
    gym = ClimbingGym.find(params[:id])
    gym.patrons.create!(climbing_gym_patrons_params)
    redirect_to "/climbing_gym/#{gym.id}/patrons"
  end
  
  def filter
    @gym = ClimbingGym.find(params[:id])
    @patrons = @gym.patrons.filter_patrons(params[:filter_membership_by_length])
    render 'index'
  end

  private
  def climbing_gym_patrons_params
    params.permit(:name, :years_member, :belay_certified)
  end
end