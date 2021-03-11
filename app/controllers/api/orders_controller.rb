class Api::OrdersController < ApplicationController
  def create
    p "current_user"
    p current_user
    p "current_user"

    # subtotal == quantity * price
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price # 300
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    
    @order = Order.new(
      product_id: params[:product_id],
      user_id: current_user.id,
      quantity: params[:quantity],
      tax: calculated_tax,
      subtotal: calculated_subtotal,
      total: calculated_total
    )
    
    @order.save!
    render 'show.json.jb'
  end
end
