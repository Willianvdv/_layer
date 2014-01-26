class UserSerializer < ActiveModel::Serializer
  attributes :id, :identifier, :attributes
end