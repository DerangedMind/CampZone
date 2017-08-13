class Kid < ApplicationRecord

  belongs_to :camp
  belongs_to :counselor
  belongs_to :group
  belongs_to :parent

  has_many :parents

  validates :first_name, :last_name, presence: true
  validates :birthdate, presence: true
  validates :sin, :medicare, presence: true

end
