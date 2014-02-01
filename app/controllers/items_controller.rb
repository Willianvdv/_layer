# -*- encoding : utf-8 -*-

class ItemsController < ApplicationController
  before_filter :load_item, only: [:update]
  
  def create
    item = Item.new item_params
    if item.save
      render json: item
    else
      render status: :bad_request, json: {errors: item.errors}
    end
  end

  def update
    if @item.update item_params
      render json: @item
    else
      render status: :bad_request, json: { errors: @item.errors }
    end
  end

  private

  def load_item
    @item = Item.find params[:id]
  end

  def item_params
    params.require(:item).permit(:name).tap do |whitelisted|
      whitelisted[:properties] = params[:item][:properties]
    end
  end
end
