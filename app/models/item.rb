# -*- encoding : utf-8 -*-

class Item < ActiveRecord::Base
  validates :identifier, presence: true, uniqueness: true
end
