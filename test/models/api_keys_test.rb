# -*- encoding : utf-8 -*-
require 'test_helper'

class ApiKeysTest < ActiveSupport::TestCase
  test 'gets the api keys' do
    assert_equal ['ABCDE'], ApiKeys.instance.send(:keys)
  end
end
