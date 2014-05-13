# -*- encoding : utf-8 -*-

class UsersController < ResourceController
  before_filter :load_resource, only: [:update]
end
