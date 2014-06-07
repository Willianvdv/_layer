# -*- encoding : utf-8 -*-

require 'test_helper'

module Api
  class AnonymousController < ApiController
    def index
      render nothing: true
    end

    def create
      render nothing: true
    end
  end
end

class Api::ApiControllerTest < ActionController::TestCase
  tests Api::AnonymousController

  def with_anonymous_routes
    with_routing do |set|
      set.draw do
        namespace :api do
          get 'anonymous_index', to: 'anonymous#index'
          get 'anonymous_create', to: 'anonymous#create'
        end
      end

      yield
    end
  end

  test 'with an api key you have access' do
    with_anonymous_routes do
      get :create, api_key: 'ABCDE'
      assert_response :success
    end
  end

  test 'without an api key you dont have access' do
    with_anonymous_routes do
      get :create
      assert_response :unauthorized
    end
  end
end
