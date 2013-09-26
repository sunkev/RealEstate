require 'spec_helper'

describe Tenant do
  it {should belong_to :building}
  it {should validate_presence_of :first_name}
  it {should validate_presence_of :last_name}
  it { should_not have_valid(:email).when(nil, '')}

  describe '#full_name' do
    it 'returns the full name' do
      guy = Tenant.new
      guy.first_name = "kevin"
      guy.last_name = 'sun'
      guy.full_name.should eq("kevin sun")
    end
  end

end
