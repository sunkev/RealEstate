require 'spec_helper'

feature 'user records buildings to database', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information } do

    # Acceptance Criteria:

    # * I must specify a street address, city, state, and postal code
    # * Only US states can be specified
    # * I can optionally specify a description of the building
    # * If I enter all of the required information in the required
    #   format, the building is recorded.
    # * If I do not specify all of the required information in the
    #   required formats, the building is not recorded and
    #   I am presented with errors
    # * Upon successfully creating a building, I am redirected so that I
    #   can record another building.


    scenario 'User creates successful building with all info' do

      building_count = Building.count
      visit new_building_path
      fill_in 'Street address', with: '46 Plum St.'
      fill_in 'City', with: 'Hamilton'
      select 'Massachusetts', from: 'State'
      fill_in 'Postal code', with: '01982'
      fill_in "Description", with: 'Best place'
      click_on 'Create Building'
      expect(Building.count).to eql(building_count + 1)

    end

    scenario 'User forgets postal code input and sees error mesage' do

      visit new_building_path
      fill_in 'Street address', with: '46 Plum St.'
      fill_in 'City', with: 'Hamilton'
      select 'Massachusetts', from: 'State'

      click_on 'Create Building'
      expect(page).to have_content("can't be blank")
    end

    scenario 'User relocated to new page after sucessful building creation' do

      visit new_building_path
      fill_in 'Street address', with: '46 Plum St.'
      fill_in 'City', with: 'Hamilton'
      select 'Massachusetts', from: 'State'
      fill_in 'Postal code', with: '01982'
      fill_in "Description", with: 'Best place'
      click_on 'Create Building'

      current_path.should == new_building_path
    end

end
