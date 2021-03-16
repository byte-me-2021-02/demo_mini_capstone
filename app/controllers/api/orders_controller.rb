class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
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
    @order = Order.new(
      user_id: 1,
      subtotal: 100,
      total: 110,
      tax: 10,      
    )
    @order.save!
    p @order.errors.full_messages
    render 'show.json.jb'
  end
end
