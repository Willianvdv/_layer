# -*- encoding : utf-8 -*-

module Api
  class ApiController < ActionController::API
    include PermittedAttributes

    before_filter :authenticate_user!
    before_filter :authorize_user!, except: [:create]

    protected

    def authenticate_user!
      head :unauthorized unless ApiKey.key? params['api_key']
    end

    def authorize_user!
      head :unauthorized unless ApiKey.power_user? params['api_key']
    end
  end
end
