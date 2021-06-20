class Sweet < ApplicationRecord
  belongs_to :genre
  attachment :image

  def add_tax_unit_price
    (self.unit_price * 1.08).round
  end
end
