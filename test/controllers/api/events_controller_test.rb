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
  test 'create a event without a event type fails' do
    event_attributes_without_a_item = event_attributes.merge(event: nil)
    post :create, format: :json, event: event_attributes_without_a_item
    assert_response :bad_request
    assert json_response['errors'].key? 'event'
  end
end
