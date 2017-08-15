class Kid < ApplicationRecord

  has_many :kids_parents
  has_many :users, through: :kids_parents

  # belongs_to :counselor
  # belongs_to :group
  # belongs_to :parent

  validates :first_name, :last_name, presence: true
  validates :birthdate, presence: true
  validates :sin, :medicare, presence: true

end
