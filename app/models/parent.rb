class Parent < ApplicationRecord

  has_many :kids, through: :kids_parents

  validates :user_id, presence: true
  validates :address, :phone_number, presence: true

end