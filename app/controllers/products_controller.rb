class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /products
  def index
    json_response(ProductService.get_all_products(product_params[:in_stock_only]))
  end

  # GET /products/:id
  def show
    json_response(@product)
  end

  private

  def product_params
    params.permit(:in_stock_only)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end