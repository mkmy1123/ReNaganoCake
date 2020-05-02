class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postcode
      t.string :address
      t.integer :payment_method, default: 0
      t.integer :order_status, default: 0
      t.integer :postage
      t.integer :payment

      t.timestamps
    end
  end
end
