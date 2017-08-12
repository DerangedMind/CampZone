class Camp < ApplicationRecord
  has_many :camps_directors
  has_many :directors, through: :camps_directors

  validates :name, :address, :phone_number,
              presence: true
end
