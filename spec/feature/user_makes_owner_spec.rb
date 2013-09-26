require 'spec_helper'

feature 'User can make owners ', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners} do

  # Acceptance Criteria:

  # * I must specify a first name, last name, and email address
  # * I can optionally specify a company name
  # * If I do not specify the required information,
  #   I am presented with errors
  # * If I specify the required information, the owner
  #   is recorded and I am redirected to enter another new owner

  scenario 'User creates successful owner' do

    owner_count = Owner.count
    visit new_owner_path
    fill_in 'First name', with: '46 Plum St.'
    fill_in 'Last name', with: 'Hamilton'
    fill_in 'Email', with: 'test@testing.com'
    fill_in 'Company name', with: 'Apple'

    click_on 'Create Owner'
    expect(Owner.count).to eql(owner_count + 1)
  end

  scenario 'User forgets first name' do

    owner_count = Owner.count
    visit new_owner_path

    fill_in 'Last name', with: 'Hamilton'
    fill_in 'Email', with: 'test@testing.com'
    fill_in 'Company name', with: 'Apple'

    click_on 'Create Owner'
    expect(Owner.count).to eql(owner_count)
    expect(page).to have_content("Not succesful sorry")

  end

  scenario 'User relocated to new page after making a owner' do

    visit new_owner_path
    fill_in 'First name', with: '46 Plum St.'
    fill_in 'Last name', with: 'Hamilton'
    fill_in 'Email', with: 'test@testing.com'
    fill_in 'Company name', with: 'Apple'

    click_on 'Create Owner'
    current_path.should == new_owner_path
  end
end