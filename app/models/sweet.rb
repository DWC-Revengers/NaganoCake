class Sweet < ApplicationRecord
  belongs_to :genre
  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :order_sweets, dependent: :destroy

  def add_tax_unit_price
    (self.unit_price * 1.08).round
  end
end
