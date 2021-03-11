class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(
      product_id: 17,
      user_id: 1,
      quantity: 10,
      tax: 10.80,
      subtotal: 120,
      total: 130.80
    )
    @order.save
    render 'show.json.jb'
  end
end
