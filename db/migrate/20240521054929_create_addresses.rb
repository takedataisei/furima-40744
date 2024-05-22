class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :order, null: false, foreign_key: true
      t.string :post_code, null: false
      t.string :tel_number, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address_line, null: false
      t.string :building_name
      t.timestamps
    end
  end
end
