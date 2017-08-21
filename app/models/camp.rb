class Camp < ApplicationRecord
  has_many :groups

  has_one :address
  belongs_to :director

  validates :name, :phone_number,
              presence: true
end
