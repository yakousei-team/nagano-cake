class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
    	t.references :genre, foreign_key: true
    	t.string :name, null: false
    	t.integer :unit_price, null: false
    	t.boolean :is_soldout, null: false, default: false
    	t.text :description, null: false
    	t.string :image_id, null: false

      t.timestamps 
    end
  end
end
