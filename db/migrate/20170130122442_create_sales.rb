class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :product_id
      t.decimal :cost
      t.date :date_of_purchase

      t.timestamps null: false
    end
  end
end
