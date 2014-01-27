class User < ActiveRecord::Base
  validates :identifier, presence: true
end