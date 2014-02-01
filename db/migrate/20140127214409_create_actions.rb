# -*- encoding : utf-8 -*-
class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :user
      t.references :item
      t.string :action

      t.timestamps
    end
  end
end
