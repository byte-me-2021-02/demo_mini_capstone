class Api::ProductsController < ApplicationController
  def index
    # getting data from the db
    @products = Product.all
    render 'all.json.jb'
  end
  
  def lamp
    @product = Product.find_by(id: 1)
    render 'lamp.json.jb'
  end

  def sleeping_bag
    @product = Product.find_by(id: 8)
    render 'sleeping_bag.json.jb'
  end
end
