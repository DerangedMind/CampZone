class Director < ApplicationRecord
  has_one :camp
  belongs_to :user

end
