class Product < ApplicationRecord
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :description, length: { in: 10..500 }
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }

  def supplier
    Supplier.find_by(id: supplier_id)
  end
  
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





# get familiar with the different query params on the different routes

# imagine if statement for having params or not

# write some code in rails console, get the syntax right (hardcoded)
# copy paste that code in my controller (hardocded)
# figure out how to make it work with params also

# make it work for all the different scenarios

