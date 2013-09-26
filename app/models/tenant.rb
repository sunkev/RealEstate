class Tenant < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_format_of :email,
    with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

  belongs_to :building,
    inverse_of: :tenants

  def full_name
    "#{first_name} #{last_name}"
  end
end