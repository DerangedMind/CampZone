class Kid < ApplicationRecord

  has_many :kids_parents
  has_many :parents, through: :kids_parents

  has_one :medical_info

  has_many :groups_kids
  has_many :groups, through: :groups_kids

  validates :first_name, :last_name, presence: true
  validates :birthdate, presence: true
<<<<<<< 9786ccddf28fc5eaff14741653c5e4674cf71ee7
  validates :sin, presence: true

=======
  validates :sin, :medicare, presence: true
>>>>>>> update new kid form to form_for. uses tag within form. update more routes
end
