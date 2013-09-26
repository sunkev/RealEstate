class BuildingsController < ApplicationController
  before_action :set_building, only: [:show]

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def show
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      flash[notice] = "Successful building added"
      redirect_to new_building_path
    else
      flash[notice] = "Building not added"
      render new_building_path
    end
  end

  private

  def set_building
     @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:street_address, :city, :state, :postal_code, :description, :owner_id)
  end
end
