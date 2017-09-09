class School < ActiveRecord::Base
  belongs_to :user
  has_many :photos

  geocoded_by :school_address
  after_validation :geocode, if: :school_address_changed?

  validates :school_name, presence: true, length: {maximum: 100}
  validates :school_address, presence: true
  validates :summary, presence: true, length: {maximum: 10000}
  validates :phone_number, presence: true
  validates :age_range, presence: true
  validates :diploma, presence: true
  
end
