# -*- encoding : utf-8 -*-

module Api
  class EventsController < ResourceController
    private

      def resource_attributes
        attributes = super

        user_identifier = attributes.delete('user_identifier')
        attributes[:user] = User.find_by identifier: user_identifier

        item_identifier = attributes.delete('item_identifier')
        attributes[:item] = Item.find_by identifier: item_identifier

        attributes
      end
  end
end
