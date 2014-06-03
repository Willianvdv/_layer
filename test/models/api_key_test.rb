# -*- encoding : utf-8 -*-
require 'test_helper'

class ApiKeyTest < ActiveSupport::TestCase
  class NormalApiKeyTest < ApiKeyTest
    test 'a valid api key is given' do
      assert ApiKey.key? 'ABCDE'
    end

    test 'an invalid api key is given' do
      refute ApiKey.key? 'NOT_AN_API_KEY'
    end
  end

  class PowerUserApiKeyTest < ApiKeyTest
    test 'a valid power user api key is given' do
      assert ApiKey.power_user? 'POWERKEY'
    end

    test 'an invalid power user api key is given' do
      refute ApiKey.power_user? 'ABCDE'
    end
  end
end
