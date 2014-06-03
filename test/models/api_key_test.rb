# -*- encoding : utf-8 -*-
require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  test 'gets the api keys' do
    assert_equal ['ABCDE'], ApiKey.instance.send(:keys)
  end
end
