class PatronsController < ApplicationController
  def index
    @patrons = Patron.all
  end

  def show
    @patron = Patron.find(params[:id])
  end
end