class OwnersController < ApplicationController
  before_action :set_owner, only: [:new, :create]

  def new
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

  private

  def set_owner
    @owner = Owner.new
  end

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :company, :email)
  end
end