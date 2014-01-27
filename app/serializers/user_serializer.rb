class UserSerializer < ActiveModel::Serializer
  attributes :id, :identifier, :properties
end