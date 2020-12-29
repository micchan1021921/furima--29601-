class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.text    :info, null: false
      t.integer :category_id ,null:false
      t.integer :sales_status_id, null: false
      t.integer :shippings_tee_status_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :scheduled_delivary_id, null: false
      t.integer :price, null: false
      t.integer :add_tax_price, null: false
      t.integer :profit, null: false

      t.timestamps
    end
  end
end
