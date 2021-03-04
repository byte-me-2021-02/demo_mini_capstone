class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    if @product.save
      # happy path
      render 'show.json.jb'
    else
      # sad path
      # show them some errors
      render json: {errors: @product.errors.full_messages}
    end
    # take in some parameters
    # save that data to the db
    # show the user the newly made product
  end

  def show
    # get data from the db
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    # show thaat data to the user
    render 'show.json.jb'
  end

  def update
    # finding a product from the db
    @product = Product.find_by(id: params[:id])
    # changing an attribute
    @product.description = params[:description]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.name = params[:name]
    # applying those chaanges to the db
    @product.save
    render 'show.json.jb'
  end

  def destroy
    # figure out which product to delete
    @product = Product.find_by(id: params[:id])
    @product.destroy
    # delete that product
    render json: {message: "product has been removed"}
  end
end
