# -*- encoding : utf-8 -*-

module Api
  class ApiController < ActionController::API
    include PermittedAttributes

    before_filter :authenticate_user!

    protected

    def authenticate_user!
      head :unauthorized unless ApiKey.instance.include? params['api_key']
    end
  end
end
