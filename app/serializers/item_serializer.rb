# -*- encoding : utf-8 -*-

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :identifier, :name, :properties, :created_at, :updated_at
end
