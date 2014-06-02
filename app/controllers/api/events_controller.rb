# -*- encoding : utf-8 -*-

module Api
  class EventsController < ResourceController
    private

      def resource_attributes
        attributes = super

        if (user_identifier = attributes.delete('user_identifier'))
          attributes[:user] = find_or_create_user user_identifier
        end

        if (item_identifier = attributes.delete('item_identifier'))
          attributes[:item] = find_or_create_item(item_identifier)
        end

        attributes
      end

      def find_or_create_item(item_identifier)
        Item.where(identifier: item_identifier).first_or_create!
      end

      def find_or_create_user(user_identifier)
        User.where(identifier: user_identifier).first_or_create!
      end
  end
end
