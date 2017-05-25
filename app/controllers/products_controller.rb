class ProductsController < ApplicationController
  before_action :get_product, only: [:show]

  def show
    json_response(@product)
  end

  def index
    total, products = Product.get_by_filter(
            params[:category], params[:limit],
            params[:page], params[:order])

    json_response({
      :total => total,
      :products => products
    })
  end


  private
  def get_product
    @product = Product.find(params[:id])
  end

end
