class Address < ApplicationRecord
  validates :city, 
            :province, 
            :country, 
            :street_address, 
            :postal_code,
              presence: true
end
