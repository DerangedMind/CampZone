class Parent < ApplicationRecord

  belongs_to :address
  belongs_to :user
  has_many :kids_parents
  has_many :kids, through: :kids_parents

  validates :address_id, :user_id, presence: true
  validates :phone_number, presence: true
end
