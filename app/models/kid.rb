class Kid < ApplicationRecord

  has_many :kids_parents
  has_many :parents, through: :kids_parents

  has_one :medicalinfo

  validates :first_name, :last_name, presence: true
  validates :birthdate, presence: true
  validates :sin, :medicare, presence: true

end
