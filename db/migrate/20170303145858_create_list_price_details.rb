class CreateListPriceDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :list_price_details do |t|
      t.string :listprice
      t.integer :service_pkservice
      t.integer :category_pkcategory
      t.integer :list_price_pklist

      t.timestamps
    end
  end
end
