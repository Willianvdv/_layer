# -*- encoding : utf-8 -*-

class ApplicationController < ActionController::API
  include PermittedAttributes

  before_filter :authenticate_user!

  protected

    def authenticate_user!
      head :unauthorized unless ApiKeys.instance.include? params['api_key']
    end
end
