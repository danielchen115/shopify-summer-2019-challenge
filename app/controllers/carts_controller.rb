class CartsController < ApplicationController
  # GET /carts/history
  def index
    json_response(current_user.carts)
  end
  # GET /carts/current
  def show
    json_response(CartService.get_cart(current_user))
  end

  #PUT /checkout
  def checkout
    response = CartService.checkout(current_user)
    json_response(response)
  end
end