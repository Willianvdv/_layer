module Sync
  module Pull
    #
    # Normaly you wouldn't use these classes. Using it makes sense if you can't
    # query the source database, e.g. when you only have access to an API.
    #

    class BasePuller
      def initialize(pull_implementation)
        @pull_implementation = pull_implementation
      end
    end

    class ItemPuller < BasePuller
      def pull_all
        pull_candidates.each do |item|
          item_data = @pull_implementation.pull_item item
          item.update_attributes(item_data)
        end
      end

      def pull_candidates
        # TODO: Don't return items with a complete profile
        Item.all
      end
    end

    class UserPuller < BasePuller
      def pull_all
        pull_candidates.each do |user|
          user_data = @pull_implementation.pull_user user
          user.update_attributes(user_data)
        end
      end

      def pull_candidates
        # TODO: Don't return users with a complete profile
        User.all
      end
    end
  end
end
