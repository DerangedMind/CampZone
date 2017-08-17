class Group < ApplicationRecord

  has_many :groups_kids
  has_many :kids, through: :groups_kids

  has_many :counselors_groups
  has_many :counselors, through: :counselors_groups

  validates :camp_id, presence: true
  validates :name, presence: true
  validates :min_age, :max_age, presence: true
  validates :start_date, presence: true

end