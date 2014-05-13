# -*- encoding : utf-8 -*-

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :properties
end
