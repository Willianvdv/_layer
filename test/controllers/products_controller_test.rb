# -*- encoding : utf-8 -*-

require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  def setup
    @product = create :product
  end

  def json_response
    JSON.parse(response.body)
  end

  def product_attributes
    {name: 'product 1', properties: {color: 'red'}}
  end

  # Create an product 
  test "create a product with name" do
    post :create, format: :json, product: product_attributes
    assert_equal 'product 1', json_response['product']['name']
  end

  test "create a product with properties" do
    post :create, format: :json, product: product_attributes
    assert_equal({'color' => 'red'}, json_response['product']['properties'])
  end

  # Errors when creating a product
  test "create a product without name fails" do
    post :create, format: :json, product: {name: nil}
    assert_response :bad_request
    assert json_response["errors"].has_key? "name"
  end

  # Update an product
  test "update an product" do
    put :update, format: :json, id: @product.id, product: {name: 'product 2'}
    assert_equal 'product 2', json_response['product']['name']
  end

  # Update an product with error
  test "update a product without name fails" do
    put :update, format: :json, id: @product.id, product: {name: nil}
    assert_response :bad_request
    assert json_response["errors"].has_key? "name"
  end
end
