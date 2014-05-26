# -*- encoding : utf-8 -*-

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    stub_authentication
  end

  def json_response
    JSON.parse(response.body)
  end

  def user_attributes
    { identifier: 'test@example.com', properties: { favorite_color: 'red' } }
  end

  # Create an user
  test 'create a user with identifier' do
    post :create, format: :json, user: user_attributes
    assert_equal 'test@example.com', json_response['user']['identifier']
  end

  test 'create a user with properties' do
    post :create, format: :json, user: user_attributes
    assert_equal({ 'favorite_color' => 'red' },
                 json_response['user']['properties'])
  end

  # Errors when creating a user
  test 'create a user without identifier' do
    post :create, format: :json, user: { identifier: nil }
    assert_response :bad_request
    assert json_response['errors'].key? 'identifier'
  end

  # Update an user
  test 'update an user' do
    put :update, format: :json,
                 id: @user.id,
                 user: { identifier: 'user@example.com' }
    assert_equal 'user@example.com', json_response['user']['identifier']
  end

  # Update an user with error
  test 'update a user without identifier' do
    put :update, format: :json, id: @user.id, user: { identifier: nil }
    assert_response :bad_request
    assert json_response['errors'].key? 'identifier'
  end
end
