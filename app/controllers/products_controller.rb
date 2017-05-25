class ProductsController < ApplicationController
  before_action :get_product, only: [:show]

  def show
    json_response(@product)
  end

  private
  def get_product
    @product = Product.find(params[:id])
  end

end
