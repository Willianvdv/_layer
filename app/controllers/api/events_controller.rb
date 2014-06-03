# -*- encoding : utf-8 -*-

module Api
  class EventsController < ResourceController
    private

      def resource_attributes
        attributes = super

        if (user_identifier = attributes.delete('user_identifier'))
          attributes[:user] = user_by_identifier user_identifier
        end

        if (item_identifier = attributes.delete('item_identifier'))
          attributes[:item] = item_by_identifier(item_identifier)
        end

        attributes
      end

      def item_by_identifier(identifier)
        Item.where(identifier: identifier).first_or_create!
      end

      def user_by_identifier(identifier)
        User.where(identifier: identifier).first_or_create!
      end
  end
end
