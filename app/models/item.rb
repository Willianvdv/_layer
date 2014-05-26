# -*- encoding : utf-8 -*-

class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :identifier, presence: true, uniqueness: true
end
