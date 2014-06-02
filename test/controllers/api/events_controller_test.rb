# -*- encoding : utf-8 -*-

require 'test_helper'

class Api::EventsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @item = create :item

    stub_authentication
  end

  def json_response
    JSON.parse(response.body)
  end

  def event_attributes
    { user_identifier: @user.identifier,
      item_identifier: @item.identifier,
      event: 'view' }
  end

  # Create an event
  test 'create a event with user and item' do
    post :create, format: :json, event: event_attributes
    assert_equal @user.id, json_response['event']['user']['id']
    assert_equal @item.id, json_response['event']['item']['id']
    assert_equal 'view', json_response['event']['event']
  end

  test 'a event is created and the item is unknown the item will be created' do
    item_attr = { item_identifier: 'UNKNOWN_ITEM_ID' }
    event_attributes_with_an_unknown_item = event_attributes.merge(item_attr)
    post :create, format: :json, event: event_attributes_with_an_unknown_item
    assert_response :success
  end

  test 'a event is created and the user is unknown the user will be created' do
    user_attr = { user_identifier: 'UNKNOWN_USER_ID' }
    event_attributes_with_an_unknown_item = event_attributes.merge(user_attr)
    post :create, format: :json, event: event_attributes_with_an_unknown_item
    assert_response :success
  end

  # When creating an event a user must be given
  test 'create a event without a user fails' do
    invalid_event_attributes = event_attributes.merge(user_identifier: nil)
    post :create, format: :json, event: invalid_event_attributes
    assert_response :bad_request
    assert json_response['errors'].key? 'user'
  end

  # When creating an event a item must be given
  test 'create a event without a item fails' do
    invalid_event_attributes = event_attributes.merge(item_identifier: nil)
    post :create, format: :json, event: invalid_event_attributes
    assert_response :bad_request
    assert json_response['errors'].key? 'item'
  end

  # When creating an event a item must be given
  test 'create an event without a event type fails' do
    event_attributes_without_a_item = event_attributes.merge(event: nil)
    post :create, format: :json, event: event_attributes_without_a_item
    assert_response :bad_request
    assert json_response['errors'].key? 'event'
  end
end
