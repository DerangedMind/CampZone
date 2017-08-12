class Kid < ApplicationRecord

  validates :first_name, :last_name, presence: true
  validates :birthdate, presence: true
  validates :sin, :medicare, presence: true

end
