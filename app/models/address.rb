class Address < ApplicationRecord

  belongs_to :customer

  def delivery_all_address
    "〒" + postal_code + address + "  " + name
  end
end
