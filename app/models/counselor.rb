class Counselor < ApplicationRecord

  belongs_to :user
  has_many :counselors_groups
  has_many :groups, through: :counselors_groups

end
