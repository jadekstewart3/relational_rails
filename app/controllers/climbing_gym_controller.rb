class ClimbingGymController < ApplicationController
  def index
    @climbing_gyms = ClimbingGym.by_created_at
  end

  def show
    @climbing_gym = ClimbingGym.find(params[:id])
    @patrons = @climbing_gym.patrons.count
  end

  def new
  end

  def create
    new_gym = ClimbingGym.create(climbing_gym_params)
    redirect_to "/climbing_gym"
  end

  def edit
    @climbing_gym = ClimbingGym.find(params[:id])
  end

  def update
    climbing_gym = ClimbingGym.find(params[:id])
    climbing_gym.update(climbing_gym_params)
    redirect_to "/climbing_gym/#{climbing_gym.id}"
  end

  private
  def climbing_gym_params
    params.permit(:name, :city, :number_of_routes, :classes_offered)
  end
end