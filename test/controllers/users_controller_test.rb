require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "create a user" do
    get :create, format: :json, user: {identifier: 'test@example.com'}
    p json_reponse
  end
end
