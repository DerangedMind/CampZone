class Parent < ApplicationRecord

  has_many :kids

  validates :user_id, presence: true
  validates :address, :phone_number, presence: true

end
