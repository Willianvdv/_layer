# -*- encoding : utf-8 -*-
class CreateItems < ActiveRecord::Migration
  def change
    create_table :items, id: :uuid do |t|
      t.string :name
      t.hstore :properties

      t.timestamps
    end
  end
end