class PatronsController < ApplicationController
  def index
    @patrons = Patron.all
  end
end