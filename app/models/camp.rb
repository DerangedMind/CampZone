class Camp < ApplicationRecord
  has_many :camps_directors
  has_many :directors, through: :camps_directors
  has_many :groups

  belongs_to :address

  validates :name, :address, :phone_number,
              presence: true
end
