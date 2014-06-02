# -*- encoding : utf-8 -*-

require 'test_helper'

class Api::ItemsControllerTest < ActionController::TestCase
  def setup
    @item = create :item
    stub_authentication
  end

  def json_response
    JSON.parse(response.body)
  end

  def item_attributes
    { identifier: 'sku_123', name: 'item 1', properties: { color: 'red' } }
  end

  # Create an item
  test 'create a item with name' do
    post :create, format: :json, item: item_attributes
    assert_equal 'item 1', json_response['item']['name']
  end

  test 'create a item with properties' do
    post :create, format: :json, item: item_attributes
    assert_equal({ 'color' => 'red' }, json_response['item']['properties'])
  end

  # Update an item
  test 'update an item' do
    put :update, format: :json, id: @item.id, item: { name: 'item 2' }
    assert_equal 'item 2', json_response['item']['name']
  end
end
