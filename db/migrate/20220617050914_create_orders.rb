class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address
      t.string :post_code
      t.string :name
      t.string :email
      t.integer :shipping_cost, default: 800
      t.integer :billing_amount
      t.integer :payment_method, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
  end
end