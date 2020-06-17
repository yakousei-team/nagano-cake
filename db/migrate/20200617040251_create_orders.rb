class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.references :customer, foreign_key: true
    	t.string :address, null: false
    	t.string :postcode, null: false
    	t.string :name, null: false
    	t.integer :total_price, null: false
    	t.integer :postage, null: false
    	t.integer :order_status, null: false, default: 0
    	t.integer :payment_method, null: false

      t.timestamps
    end
  end
end
