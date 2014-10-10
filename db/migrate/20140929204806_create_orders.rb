class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :status, default: 'ordered'
      t.string :exchange
      t.string :street_number
      t.string :street
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end

    execute "ALTER TABLE orders ADD CONSTRAINT exchange_options CHECK (exchange IN ('pickup', 'delivery'))"

    execute "ALTER TABLE orders ADD CONSTRAINT status_options CHECK (status IN ('ordered', 'paid', 'cancelled', 'completed'))"
  end
end
