require 'spec_helper'

describe Owner do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it { should_not have_valid(:email).when(nil, '')}

  it { should have_many(:buildings) }

  describe '#full_name' do
    it 'returns the full name' do
      guy = Owner.new
      guy.first_name = "kevin"
      guy.last_name = 'sun'
      guy.full_name.should eq("kevin sun")
    end
  end

  # describe '#full_name_array' do
  #   it 'should return all full names of the owners in a group' do
  #     FactoryGirl.create_list(:owner, 2, first_name: 'kevin', last_name: 'sun')

  #     Owner.full_name_array.should eq(['kevin sun', 'kevin sun'])
  #   end
  # end
end
