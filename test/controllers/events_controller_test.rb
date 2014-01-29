require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @product = create :product
  end

  def json_response
    JSON.parse(response.body)
  end

  def event_attributes
    {user_id: @user.id, product_id: @product.id, event: 'view'}
  end

  # Create an event 
  test "create a event with user and product" do
    post :create, format: :json, event: event_attributes
    assert_equal @user.id, json_response['event']['user']['id']
    assert_equal @product.id, json_response['event']['product']['id']
    assert_equal 'view', json_response['event']['event']
  end

  # When creating an event a user must be given
  test "create a event without a user fails" do
    event_attributes_without_a_user = event_attributes.merge(user_id: nil)
    post :create, format: :json, event: event_attributes_without_a_user
    assert_response :bad_request
    assert json_response["errors"].has_key? "user"
  end

  # When creating an event a product must be given
  test "create a event without a product fails" do
    event_attributes_without_a_product = event_attributes.merge(product_id: nil)
    post :create, format: :json, event: event_attributes_without_a_product
    assert_response :bad_request
    assert json_response["errors"].has_key? "product"
  end

  # When creating an event a product must be given
  test "create a event without a event type fails" do
    event_attributes_without_a_product = event_attributes.merge(event: nil)
    post :create, format: :json, event: event_attributes_without_a_product
    assert_response :bad_request
    assert json_response["errors"].has_key? "event"
  end

end