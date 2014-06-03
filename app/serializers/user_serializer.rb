# -*- encoding : utf-8 -*-

class UserSerializer < ActiveModel::Serializer
  attributes :id, :identifier, :properties, :created_at, :updated_at
end
