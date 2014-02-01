# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  validates :name, presence: true
end
