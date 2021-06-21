class CartItem < ApplicationRecord
  
  belongs_to :sweet
  belongs_to :customer
  
end
