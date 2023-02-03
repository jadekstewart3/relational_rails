class ClimbingGymController < ApplicationController
  def index
    @climbing_gyms = ClimbingGym.sort
  end

  def show
    @climbing_gym = ClimbingGym.find(params[:id])
  end
end