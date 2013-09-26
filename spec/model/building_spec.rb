require 'spec_helper'

describe Building do
  it { should validate_presence_of :street_address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_numericality_of(:postal_code) }

  it { should have_valid(:state).when('Massachusetts', 'Montana', 'New Jersey')}
  it { should_not have_valid(:state).when(nil, '')}

  it { should belong_to(:owner) }
end

