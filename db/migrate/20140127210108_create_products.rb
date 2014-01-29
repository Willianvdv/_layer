class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.hstore :properties

      t.timestamps
    end
  end
end
