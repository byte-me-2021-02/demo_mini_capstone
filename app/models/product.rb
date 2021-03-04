class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { in: 10..500 }

  
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
