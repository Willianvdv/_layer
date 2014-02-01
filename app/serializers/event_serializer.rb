class EventSerializer < ActiveModel::Serializer
  attributes :id, :event
  has_one :item
  has_one :user
end
