class ClimbingGymController < ApplicationController
  def index
    @climbing_gyms = ClimbingGym.all
  end

  def show
    @climbing_gym = ClimbingGym.find(params[:id])
  end
end