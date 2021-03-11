class Api::OrdersController < ApplicationController
  def index
    
    
    # @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    # @orders = Order.all
    render 'index.json.jb'
  end
  
  def show
    # p "current_user"
    # p current_user
    # p "current_user"

    # @order = Order.find_by(id: params[:id], user_id: current_user.id)
    @order = current_user.orders.find_by(id: params[:id])
    render 'show.json.jb'
  end
  
  
  def create

    # subtotal == quantity * price
    product = Product.find_by(id: params[:product_id])
    calculated_subtotal = params[:quantity].to_i * product.price # 300
    # calculated_tax = calculated_subtotal * 0.09
    calculated_tax = params[:quantity].to_i * product.tax
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
