# -*- encoding : utf-8 -*-
require 'coveralls'
Coveralls.wear!

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'
require 'factories/user'
require 'factories/item'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include FactoryGirl::Syntax::Methods
end

def stub_authentication
  @controller.stubs(:authenticate_user!)
end

def stub_authorize
  @controller.stubs(:authorize_user!)
end
