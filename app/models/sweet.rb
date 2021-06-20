class Sweet < ApplicationRecord
  belongs_to :genre
  attachment :image
end
