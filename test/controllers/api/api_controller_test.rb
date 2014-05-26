# -*- encoding : utf-8 -*-

require 'test_helper'

module Api
  class AnonymousController < ApiController
    def index
      render nothing: true
    end
  end
end

class Api::ApiControllerTest < ActionController::TestCase
  tests Api::AnonymousController

  def with_anonymous_routes(&block)
    with_routing do |set|
      set.draw do
        namespace :api do
          get 'anonymous', to: 'anonymous#index'
        end
      end

      yield
    end
  end

  setup do
    ApiKeys.any_instance.stubs(:keys).returns(['1234'])
  end

  test 'with an api key you have access' do
    with_anonymous_routes do
      get :index, api_key: '1234'
      assert_response :success
    end
  end

  test 'without an api key you dont have access' do
    with_anonymous_routes do
      get :index
      assert_response :unauthorized
    end
  end
end
