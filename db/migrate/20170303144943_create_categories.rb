class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories ,id:false do |t|
      t.string :cat_description
      t.string :cat_note      
      t.primary_key :pkcategory
      t.timestamps
    end
  end
end
