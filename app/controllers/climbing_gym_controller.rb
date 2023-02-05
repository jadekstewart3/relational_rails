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
    new_gym = ClimbingGym.create(name: params[:name], city: params[:city], number_of_routes: params[:number_of_routes], classes_offered: params[:classes_offered])

    redirect_to "/climbing_gym"
  end
end