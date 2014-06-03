# -*- encoding : utf-8 -*-
require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  test 'a valid api key is given' do
    assert ApiKey.key? 'ABCDE'
  end

  test 'an invalid api key is given' do
    refute ApiKey.key? 'NOT_AN_API_KEY'
  end
end
