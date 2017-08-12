class Director < ApplicationRecord
  has_many :camps_directors
  has_many :camps, through: :camps_directors
end
