class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name, null: false
      t.text    :info, null: false
      t.integer :category, null: false
      t.integer :seles_status, null: false
      t.integer :shippings_tee_status, null: false
      t.integer :prefecture, null: false
      t.integer :scheduled_delivary, null: false
      t.integer :price, null: false
      t.integer :add_tax_price, null: false
      t.integer :profit, null: false

      t.timestamps
    end
  end
end
