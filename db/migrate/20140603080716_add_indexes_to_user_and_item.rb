class AddIndexesToUserAndItem < ActiveRecord::Migration
  def change
    add_index :items, :identifier
    add_index :users, :identifier
  end
end
