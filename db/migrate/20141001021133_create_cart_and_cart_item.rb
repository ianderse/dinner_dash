class CreateCartAndCartItem < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :carts, :user_id

    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
    add_index :cart_items, :cart_id
  end
end
