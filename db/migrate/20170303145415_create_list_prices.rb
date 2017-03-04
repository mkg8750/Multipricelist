class CreateListPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :list_prices ,id:false do |t|
      t.string :lis_default_mark
      t.string :lis_description
      t.primary_key :pklist

      t.timestamps
    end
  end
end
