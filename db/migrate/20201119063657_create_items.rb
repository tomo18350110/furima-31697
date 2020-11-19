class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :explanation
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_charges_id
      t.integer :shipping_area_id
      t.integer :days_to_ship_id
      t.integer :item_price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
