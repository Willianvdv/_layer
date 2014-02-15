# -*- encoding : utf-8 -*-
class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :item_id
      t.string :event

      t.timestamps
    end
  end
end
