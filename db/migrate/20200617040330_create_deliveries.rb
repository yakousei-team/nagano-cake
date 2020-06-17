class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
    	t.references :customer, foreign_key: true
    	t.string :name, null: false
    	t.string :address, null: false
    	t.string :postcode, null: false
      t.timestamps
    end
  end
end
