class MedicalInfo < ApplicationRecord
  belongs_to :kid

  validates :medicare,
            :allergies,
            :conditions,
            :medications,
            :dietary_restrictions,
            :epi_pen,
              presence: true
end
