class Address < ApplicationRecord
  validates :city, 
            :province, 
            :country, 
            :street_address, 
            :apt_number, 
            :postal_code,
              presence: true
end
