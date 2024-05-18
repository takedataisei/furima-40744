class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :item_detail, null: false
      t.integer :price, null: false
      t.integer :genre_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :shipping_cost_burden_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_day_id, null: false
      t.timestamps
    end
  end
end
