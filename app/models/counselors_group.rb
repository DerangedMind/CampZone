class CounselorsGroup < ApplicationRecord
  belongs_to :counselor
  belongs_to :group
end