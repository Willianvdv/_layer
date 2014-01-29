class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.references :user
      t.references :product
      t.string :action

      t.timestamps
    end
  end
end
