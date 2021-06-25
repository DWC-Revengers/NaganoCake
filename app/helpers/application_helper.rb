module ApplicationHelper

  def tax_price(price)
    (price * 1.08).floor
  end

  def sub_total(sub)
    tax_price(sub.sweet.unit_price) * sub.amount
  end

  def total_price(totals)
    sum = 800
    totals.each do |total|
     sum += sub_total(total)
    end
    return sum
  end

end
