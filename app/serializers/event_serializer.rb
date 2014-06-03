# -*- encoding : utf-8 -*-

class EventSerializer < ActiveModel::Serializer
  attributes :id, :event, :created_at
  has_one :item
  has_one :user
end
