class Building < ActiveRecord::Base
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates :postal_code, numericality: { only_integer: true }

  belongs_to :owner,
    inverse_of: :buildings


  US_STATES = [
      'Alabama', 'Alaska', 'Arizona', 'Arkansas',
      'California', 'Colorado', 'Connecticut', 'Delaware',
      'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois',
      'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
      'Maine',  'Maryland', 'Massachusetts', 'Michigan',
      'Minnesota', 'Mississippi', 'Missouri', 'Montana',
      'Nebraska', 'Nevada',  'New Hampshire',  'New Jersey',
      'New Mexico', 'New York', 'North Carolina',
      'North Dakota', 'Ohio', 'OH', 'Oklahoma', 'Oregon',
      'Pennsylvania', 'Rhode Island', 'South Carolina',
      'South Dakota', 'Tennessee', 'Texas', 'Utah',
      'Vermont', 'Virginia', 'Washington', 'West Virginia',
      'Wisconsin', 'Wyoming'
    ]

  def self.us_states
    US_STATES
  end



end