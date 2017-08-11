class Group < ApplicationRecord

  has_many :kids

  validates :camp_id, presence: true
  validates :name, presence: true
  validates :min_age, :max_age, presence: true
  validates :start_date, presence: true

end