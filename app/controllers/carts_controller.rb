class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy]

  # GET /carts
  def index
    @carts = Cart.all
    json_response(@carts)
  end

  # GET /carts/:id
  def show
    json_response(@cart)
  end

  # PUT /carts/:id
  def update
    @cart.update(cart_params)
    head :no_content
  end

  # DELETE /carts/:id
  def destroy
    @cart.destroy
    head :no_content
  end

  private

  def cart_params
    # whitelist params
    params.permit(:user_id, :total_amount, :checkout_date)
  end

  def set_cart
    @cart = Cart.find(params[:id])
  end
end