class Group < ApplicationRecord

  belongs_to :counselor
  has_many :kids

  validates :camp_id, presence: true
  validates :name, presence: true
  validates :min_age, :max_age, presence: true
  validates :startdate, presence: true

end