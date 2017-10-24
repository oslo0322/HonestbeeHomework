class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :purchase_id, :integer

    create_table :purchases do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :payment_type
      t.string :status

      t.timestamps
    end
  end
end
