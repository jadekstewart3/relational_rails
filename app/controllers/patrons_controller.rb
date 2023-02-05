class PatronsController < ApplicationController
  def index
    @patrons = Patron.is_belay_certified
  end

  def show
    @patron = Patron.find(params[:id])
  end

  def edit
    @patron = Patron.find(params[:id])
  end

  def update
    patron = Patron.find(params[:id])
    patron.update(patron_params)
    redirect_to "/patrons/#{patron.id}"
  end

  private
  def patron_params
    params.permit(:name, :years_member, :belay_certified)
  end
end