class Product < ApplicationRecord
  def is_discounted?
    if price > 10
      return false
    else
      return true
    end
  end

  def tax
    price * 0.09
  end  

  def total
    price + tax
  end
end
