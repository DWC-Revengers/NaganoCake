class Genre < ApplicationRecord
  has_many :sweets, dependent: :destroy
end
