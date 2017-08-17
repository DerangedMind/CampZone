class Kid < ApplicationRecord

  has_many :kids_parents
  has_many :parents, through: :kids_parents

  has_one :medical_info

  has_many :groups_kids
  has_many :groups, through: :groups_kids

  validates :first_name, :last_name, presence: true
  validates :birthdate, presence: true
  validates :sin, presence: true

end
