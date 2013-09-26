class OwnersController < ApplicationController
  before_action :set_owner, only: [:destroy]

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      flash[notice] = "Successful owner added"
      redirect_to new_owner_path
    else
      flash[notice] = "Not succesful sorry"
      render new_owner_path
    end
  end

  def destroy

    @owner.destroy
    redirect_to buildings_path
  end

  private

  def set_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :company, :email)
  end
end