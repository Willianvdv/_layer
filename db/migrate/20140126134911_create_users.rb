# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.string :identifier
      t.hstore :properties

      t.timestamps
    end
  end
end
