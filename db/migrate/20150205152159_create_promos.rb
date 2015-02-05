class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
      t.text :description
      t.string :product
      t.string :shop
      t.string :location
      t.string :picture
      t.decimal :discount
      t.integer :normal_price
      t.string :category

      t.timestamps
    end
  end
end
