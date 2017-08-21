class Address < ApplicationRecord
  belongs_to :camp

  validates :city,
            :province,
            :country,
            :street_address,
            :postal_code,
              presence: true

end
