# -*- encoding : utf-8 -*-

class ProductsController < ApplicationController
  before_filter :load_product, only: [:update]
  
  def create
    product = Product.new product_params
    if product.save
      render json: product
    else
      render status: :bad_request, json: {errors: product.errors}
    end
  end

  def update
    if @product.update product_params
      render json: @product
    else
      render status: :bad_request, json: {errors: @product.errors}
    end
  end

  private
  def load_product
    @product = Product.find params[:id]
  end

  def product_params
    params.require(:product).permit(:name).tap do |whitelisted|
      whitelisted[:properties] = params[:product][:properties]
    end
  end
end