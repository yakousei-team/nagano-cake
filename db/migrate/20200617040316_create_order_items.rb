class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
    	t.references :item, foreign_key: true
    	t.references :order, foreign_key: true
    	t.integer :price
    	t.integer :quantity
    	t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
