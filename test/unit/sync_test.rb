# -*- encoding : utf-8 -*-

require 'test_helper'

class SyncTest < ActiveSupport::TestCase
  class SyncPullUserTest < SyncTest
    setup do
      @user = FactoryGirl.create :user
      @user_pull_implementation = mock()
      @subject = Sync::Pull::UserPuller.new @user_pull_implementation
    end

    test '.pull_candidates returns all users that should be syned' do
      assert_equal [@user], @subject.pull_candidates
    end

    test '.pull_all will update all users' do
      @user_pull_implementation.expects(:pull_user)
                               .with(@user)
                               .returns({ properties: { name: 'Willian' } })
      @subject.pull_all
      assert_equal 'Willian', @user.reload.properties['name']
    end
  end
end
