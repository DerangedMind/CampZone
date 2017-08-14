class Parent < ApplicationRecord

  has_many :kids_parents
  has_many :kids, through: :kids_parents

  validates :user_id, presence: true
  validates :address, :phone_number, presence: true

<<<<<<< HEAD
end
=======
end
>>>>>>> baeeec5cc36f167ec1381b7982d7bedea54511aa
