# -*- encoding : utf-8 -*-

class User < ActiveRecord::Base
  validates :identifier, presence: true, uniqueness: true
end
