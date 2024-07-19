class CreateShareds < ActiveRecord::Migration[7.0]
  def change
    create_table :shareds do |t|
      t.string :postcode, null: false
      t.integer :shipping_region_id, null: false
      t.string :municipalities, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.references :order, foreign_key: true, null: false
      t.timestamps
    end
  end
end
