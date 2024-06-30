class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,                   null: false
      t.text :product_description,           null: false
      t.integer :category_id,                null: false
      t.integer :product_condition_id,       null: false
      t.integer :shipping_fee_burden_id,     null: false
      t.integer :shipping_region_id,         null: false
      t.integer :days_until_shipping_id,     null: false
      t.integer :price,                      null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end 