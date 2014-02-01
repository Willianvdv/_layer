class Event < ActiveRecord::Base
  validates :product, presence: true
  validates :user, presence: true
  validates :event, presence: true

  belongs_to :product
  belongs_to :user
end
