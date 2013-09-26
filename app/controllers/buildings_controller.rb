class BuildingsController < ApplicationController
  before_action :set_building, only: [:new]

  def new
  end

  private

  def set_building
    @building = Building.new
  end

  def building_params
    params.require(:building).permit(:street_address, :city, :state, :postal_code, :description)
  end
end
