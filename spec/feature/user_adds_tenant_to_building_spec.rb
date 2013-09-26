require 'spec_helper'

feature 'Owner adds tenants to apartments', %Q{
  As an owner
  I want to add a tenant
  So that I can keep track of who is renting in my building} do

  # Acceptance Criteria:

    # * I must specify a first name, last name, building
    #   they're renting in, and valid email address.
    # * If the tenant information is valid, the tenant is
    #   associated with the building. The information is persisted.
    # * If the tenant information is invalid, an error message
    #   is supplied so the landlord can fix the entry.
    #   The information is not persisted.

  before(:each) do
    FactoryGirl.create(:owner)
    visit new_building_path
    fill_in 'Street address', with: '46 Plum St.'
    fill_in 'City', with: 'Hamilton'
    select 'Massachusetts', from: 'State'
    fill_in 'Postal code', with: '01982'
    fill_in "Description", with: 'Best place'
    select 'John Smith', from: 'Owner'

    click_on 'Create Building'
   end

  scenario 'Owner adds tenant to building' do

    tenant_count = Tenant.count
    visit new_tenant_path

    fill_in 'First name', with: 'Kevin'
    fill_in 'Last name', with: 'Sun'
    fill_in 'Email', with: 'test@testing.com'
    select '46 Plum St.', from: 'Building'

    click_on 'Create Tenant'
    expect(Tenant.count).to eql(tenant_count+1)

  end

  scenario 'Owner can see tenants of a building' do

    visit new_tenant_path

    fill_in 'First name', with: 'Kevin'
    fill_in 'Last name', with: 'Sun'
    fill_in 'Email', with: 'test@testing.com'
    select '46 Plum St.', from: 'Building'

    click_on 'Create Tenant'
    visit building_path(Building.last)
    expect(page).to have_content('Kevin Sun')

  end



end
