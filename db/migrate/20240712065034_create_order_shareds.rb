class CreateOrderShareds < ActiveRecord::Migration[7.0]
  def change
    create_table :order_shareds do |t|

      t.timestamps
    end
  end
end
