class Owner < ActiveRecord::Base

  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_format_of :email,
    with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

  has_many :tenants, through: :buildings

  has_many :buildings,
    inverse_of: :owner,
    dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.full_name_array
    name_array = []
    self.all.each do |owner|
      name_array << owner.full_name
    end
    name_array
  end

end