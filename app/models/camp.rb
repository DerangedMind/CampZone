class Camp < ApplicationRecord
  has_many :camps_directors
  has_many :directors, through: :camps_directors
  has_many :groups

  has_one :address

  validates :name, :phone_number,
              presence: true
end
