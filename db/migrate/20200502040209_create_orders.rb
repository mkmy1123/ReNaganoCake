class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null:false
      t.string :postcode, null:false
      t.string :address, null:false
      t.integer :payment_method, null:false, default: 0
      t.integer :order_status, null:false, default: 0
      t.integer :postage, null:false
      t.integer :payment, null:false

      t.timestamps
    end
  end
end
