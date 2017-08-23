class MedicalInfo < ApplicationRecord
  belongs_to :kid

  validates :medicare,
            :allergies,
            :conditions,
            :medications,
            :dietary_restrictions,
              presence: true
end
