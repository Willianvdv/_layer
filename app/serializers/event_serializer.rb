class EventSerializer < ActiveModel::Serializer
  attributes :id, :event
  has_one :product
  has_one :user
end
