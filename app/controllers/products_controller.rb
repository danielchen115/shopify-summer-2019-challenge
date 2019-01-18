class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :add_to_cart, :remove_from_cart]

  # GET /products
  def index
    json_response(ProductService.get_all_products(product_params[:in_stock_only]))
  end

  # GET /products/:id
  def show
    json_response(@product)
  end

  # PUT /products/:id/addtocart
  def add_to_cart
    cart = CartService.add_to_cart(@product, current_user, cart_params[:quantity].to_i)
    json_response(cart)
  end

  # PUT /products/:id/removefromcart
  def remove_from_cart
    cart = CartService.remove_from_cart(@product, current_user, cart_params[:quantity].to_i)
    json_response(cart)
  end

  private

  def product_params
    params.permit(:in_stock_only)
  end

  def cart_params
    params.permit(:quantity)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end