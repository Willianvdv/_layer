# -*- encoding : utf-8 -*-

class ItemsController < ResourceController
  before_filter :load_resource, only: [:update]
end
