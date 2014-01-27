require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def json_response
    JSON.parse(response.body)
  end

  # Create an user 

  test "create a user with identifier" do
    get :create, format: :json, user: {identifier: 'test@example.com'}
    assert_equal 'test@example.com', json_response['user']['identifier']
  end

  test "create a user with properties" do
    get :create, format: :json, user: {identifier: 'test@example.com', properties: {favorite_color: 'red'}}
    assert_equal({'favorite_color' => 'red'}, json_response['user']['properties'])
  end
end
