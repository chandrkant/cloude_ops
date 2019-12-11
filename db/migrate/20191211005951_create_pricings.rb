class CreatePricings < ActiveRecord::Migration[6.0]
  def change
    create_table :pricings do |t|
      t.string :sku
      t.string :rate_code
      t.string :description
      t.integer :begin_range
      t.string :unit
      t.float :price_per_unit
      t.datetime :effective_date
      t.string :location
      t.string :servicename

      t.timestamps
    end
    add_index :pricings, :sku
    add_index :pricings, :rate_code
    add_index :pricings, :effective_date
    add_index :pricings, :location
  end
end
