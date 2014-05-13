# -*- encoding : utf-8 -*-

class Event < ActiveRecord::Base
  validates :item, presence: true
  validates :user, presence: true
  validates :event, presence: true

  belongs_to :item
  belongs_to :user
end
