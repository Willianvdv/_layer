# -*- encoding : utf-8 -*-

class User < ActiveRecord::Base
  validates :identifier, presence: true

  def sync_with_prediction_io
    Layer::PredictionIo::User.new(self).sync!
  end
end
