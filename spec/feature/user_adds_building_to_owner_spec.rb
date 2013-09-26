require 'spec_helper'

feature 'User can add buildings to owners', %Q{
  As a real estate associate
  I want to match an owner of a building
  So that I can refer back to pertinent information} do

  # Acceptance Criteria:

  # * When recording a building, I want to optionally
  #   associate the building with its rightful owner.
  # * If I delete an owner, the owner and its primary
  #   key should no longer be associated with any properties.


  scenario 'User adds owner to a building' do

    FactoryGirl.create(:owner)

    visit new_building_path
    fill_in 'Street address', with: '46 Plum St.'
    fill_in 'City', with: 'Hamilton'
    select 'Massachusetts', from: 'State'
    fill_in 'Postal code', with: '01982'
    fill_in "Description", with: 'Best place'

    select 'John Smith', from: 'Owner'

    click_on 'Create Building'

    expect(Building.last.owner).to eq(Owner.last)
  end

end