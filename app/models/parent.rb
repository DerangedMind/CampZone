class Parent < ApplicationRecord

  belongs_to :user
  has_many :kids_parents
  has_many :kids, through: :kids_parents

  validates :user_id, presence: true
  validates :address, :phone_number, presence: true

end
