class TenantsController < ApplicationController
  before_action :set_tenant, only: [:destroy]

  def index
    @tenant = Tenant.all
  end

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(owner_params)
    if @tenant.save
      flash[notice] = "Successful tenant added"
      redirect_to new_owner_path
    else
      flash[notice] = "Not succesful sorry"
      render new_owner_path
    end
  end

  def destroy
    # binding.pry
    @tenant.destroy
    redirect_to new_owner_path
  end

  private

  def set_owner
    @tenant = Tenant.find(params[:id])
  end

  def owner_params
    params.require(:tenant).permit(:first_name, :last_name, :building_id, :email)
  end
end