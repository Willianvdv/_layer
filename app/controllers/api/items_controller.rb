# -*- encoding : utf-8 -*-

module Api
  class ItemsController < ResourceController
    before_filter :load_resource, only: [:update]
  end
end
