class CreateShippingCostBurdens < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_cost_burdens do |t|

      t.timestamps
    end
  end
end
